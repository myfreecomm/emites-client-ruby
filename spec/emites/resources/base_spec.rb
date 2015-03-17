require "spec_helper"

describe Emites::Resources::Base do

  module Emites::Entities
    class Dummy < Base
    end
  end

  module Emites::Resources
    class Dummy < Base
      def fetch
        response = http.get("/1mayrfq1")
        parsed_body(response)
      end

      def notifiable(id)
        "notifiable [#{id}]"
      end

      notify :notifiable
    end
  end

  let(:http) { Emites::Http.new("7A75E575CFDEDB91FF7E2CE22089181A") }

  subject { Emites::Resources::Dummy.new(http) }

  before do
    allow(Emites.configuration).to receive(:url).and_return("http://requestb.in")
    allow(http).to receive(:send_request).and_return(OpenStruct.new(body: nil, return_code: :ok))
  end

  describe "#parsed_body" do
    it "does not raise an error" do
      expect{ subject.fetch }.not_to raise_error
    end

    it "response returns an empty hash" do
      expect(subject.fetch).to eq({})
    end
  end

  describe ".notify" do
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

end