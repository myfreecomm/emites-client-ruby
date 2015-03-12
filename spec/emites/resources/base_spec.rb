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
    end
  end

  let(:http) { Emites::Http.new("7A75E575CFDEDB91FF7E2CE22089181A") }

  subject { Emites::Resources::Dummy.new(http) }

  describe "#parsed_body" do
    before do
      allow(Emites.configuration).to receive(:url).and_return("http://requestb.in")
      allow(http).to receive(:send_request).and_return(OpenStruct.new(body: nil, return_code: :ok))
    end

    it "does not raise an error" do
      expect{ subject.fetch }.not_to raise_error
    end

    it "response returns an empty hash" do
      expect(subject.fetch).to eq({})
    end
  end

end