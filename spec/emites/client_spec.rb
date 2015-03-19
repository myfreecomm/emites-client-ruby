require "spec_helper"

describe Emites::Client do
  let(:token) { "7A75E575CFDEDB91FF7E2CE22089181A" }
  subject     { described_class.new(token) }

  describe "#authenticated?" do
    context "with a valid token" do
      it "returns true" do
        VCR.use_cassette("client/authenticated/true") do
          expect(subject.authenticated?).to be_truthy
        end
      end
    end

    context "with an invalid token" do
      subject { described_class.new("FAKE-TOKEN") }

      it "returns false" do
        VCR.use_cassette("client/authenticated/false") do
          expect(subject.authenticated?).to be_falsey
        end
      end
    end
  end

  describe "#emitters" do
    it "returns an instance of Emites::Resources::Emitter" do
      expect(subject.emitters).to be_a(Emites::Resources::Emitter)
    end
  end

  describe "#webhooks" do
    it "returns an instance of Emites::Resources::Webhook" do
      expect(subject.webhooks).to be_a(Emites::Resources::Webhook)
    end
  end

  describe "#nfse" do
    it "returns an instance of Emites::Resources::Nfse" do
      expect(subject.nfse).to be_a(Emites::Resources::Nfse)
    end
  end

end