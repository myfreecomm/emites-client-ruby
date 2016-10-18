require "spec_helper"

describe Emites::Resources::Base do

  module Emites::Entities
    class Dummy < Base
    end
  end

  module Emites::Resources
    class Dummy < Base
      def parseable
        response = http.get("/1mayrfq1")
        parsed_body(response)
      end

      def fail
        http.get("/fail")
      end

      def timeout
        http.get("/timeout")
      end

      def notifiable(id)
        "notifiable [#{id}]"
      end

      notify :notifiable
    end
  end

  let(:http) { Emites::Http.new("7A75E575CFDEDB91FF7E2CE22089181A") }
  let(:request) { double(body: nil, return_code: :ok) }

  subject { Emites::Resources::Dummy.new(http) }

  before do
    allow(Emites.configuration).to receive(:url).and_return("http://requestb.in")
  end

  describe ".notify" do
    before do
      allow(http).to receive(:send_request).and_return(request)
    end

    class FakeListener
      def call(result, args)
        [result, args]
      end
    end

    let(:listener) { FakeListener.new }

    before do
      Emites.subscribe("emites.dummy.notifiable", listener)
    end

    it "does not affect method return" do
      expect(subject.notifiable(42)).to eq("notifiable [42]")
    end

    it "notifies listeners about event" do
      expect(listener).to receive(:call).with("notifiable [42]", [42]).
        and_return(["notifiable [42]", [42]])
      subject.notifiable(42)
    end
  end

  context "when request fails" do

    it "raises an RequestError" do
      Typhoeus.stub(/fail/).and_return(Typhoeus::Response.new(return_code: nil))
      expect { subject.fail }.to raise_error(Emites::RequestError)
    end

    it "raises an RequestTimeout" do
      Typhoeus.stub(/timeout/).and_return(Typhoeus::Response.new(return_code: :operation_timedout))
      expect { subject.timeout }.to raise_error(Emites::RequestTimeout)
    end
  end
end
