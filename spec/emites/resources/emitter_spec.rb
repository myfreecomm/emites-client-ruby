require "spec_helper"
include Emites::Resources

describe Emitter do
  let(:http)          { Emites::Http.new("7A75E575CFDEDB91FF7E2CE22089181A") }
  let(:entity_klass)  { Emites::Entities::Emitter }

  subject { described_class.new(http) }

  it "has a instance of Emites::Http" do
    expect(subject.http).to eq http
  end

  describe "#list" do
    it "list all emitters if has no parameters" do
      VCR.use_cassette("emitters/list") do
        entities = subject.list
        expect(entities).to be_a(Array)
        entities.each do |e|
          expect(e).to be_a(entity_klass)
        end
      end
    end
  end

  describe "#show" do
    it "returns an instance of Emites::Entities::Emitter" do
      VCR.use_cassette("emitters/show") do
        expect(subject.show(4)).to be_a(entity_klass)
      end
    end
  end

end