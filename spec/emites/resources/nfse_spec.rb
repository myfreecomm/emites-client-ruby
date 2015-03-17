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

  describe "#info" do
    it "returns a Nfse instance where id is 456" do
      VCR.use_cassette("nfse/info/success") do
        nfse = subject.info(456)
        expect(nfse).to be_a(entity_klass)
        expect(nfse.serie). to eq("MYFC")
        expect(nfse.taker).to be_a(Emites::Entities::Taker)
      end
    end
  end

  describe "#status" do
    it "returns a Nfse instance status representation" do
      VCR.use_cassette("nfse/status/success") do
        nfse_status = subject.status(456)
        expect(nfse_status).to be_a(Emites::Entities::NfseStatus)
        expect(nfse_status.status).to eq("accepted")
        expect(nfse_status.description).to eq("Processado pela Sefaz")
      end
    end
  end

  describe "#history" do
    it "returns a Nfse instance status history" do
      VCR.use_cassette("nfse/history/success") do
        nfse_status_history = subject.history(456)
        expect(nfse_status_history).to be_a(Array)
        nfse_status_history.each do |e|
          expect(e).to be_a(Emites::Entities::NfseStatusTransition)
        end
      end
    end
  end

end