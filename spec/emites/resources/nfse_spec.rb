require "spec_helper"

describe Emites::Resources::Nfse do
  let(:http)          { Emites::Http.new("7A75E575CFDEDB91FF7E2CE22089181A") }
  let(:entity_klass)  { Emites::Entities::Nfse }

  subject { described_class.new(http) }

  it "has a instance of Emites::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "returns an array of Nfse" do
      VCR.use_cassette("nfse/list/success") do
        nfses = subject.list
        expect(nfses).to be_a(Array)
        nfses.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

end