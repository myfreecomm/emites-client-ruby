require "spec_helper"
include Emites::Resources

describe Emitter do
  let(:http) { Emites::Http.new("7A75E575CFDEDB91FF7E2CE22089181A") }

  subject { described_class.new(http) }

  it "has a instance of Emites::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "list all emiiters if has no parameters" do
      emiter1 = OpenStruct.new(id: 4)
      emiter2 = OpenStruct.new(id: 10)
      emiter3 = OpenStruct.new(id: 14)
      VCR.use_cassette("list_emitters") do
        expect(subject.list).to match_array [emiter1, emiter2, emiter3]
      end
    end
  end
end
