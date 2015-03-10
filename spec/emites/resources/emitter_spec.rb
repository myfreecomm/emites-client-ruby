require "spec_helper"
include Emites::Resources

describe Emitter do
  let(:client) { Emites::Client.new("7A75E575CFDEDB91FF7E2CE22089181A") }

  subject { described_class.new(client) }

  it "has a instance of Emites::Client" do
    expect(subject.client).to eq client
  end

  describe "#search" do
    it "finds all emiiters if has no parameters" do
      emiter1 = OpenStruct.new(id: 4)
      emiter2 = OpenStruct.new(id: 10)
      emiter3 = OpenStruct.new(id: 14)
      VCR.use_cassette("search_emitters") do
        expect(subject.search).to match_array [emiter1, emiter2, emiter3]
      end
    end
  end
end
