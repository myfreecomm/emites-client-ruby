require "spec_helper"

describe Emites::Client do

  describe "#authenticated?" do
    let(:token) { "3064F9B4DFFF2FA4287B5D42D7245F40" }

    subject { described_class.new(token) }

    it "is true if authentication succeeds" do
      VCR.use_cassette("authentication_succeeds") do
        expect(subject.authenticate).to be_truthy
      end
    end

    it "is false if authentication fails" do
      allow(subject).to receive(:token).and_return(nil)
      VCR.use_cassette("authentication_fails") do
        expect(subject.authenticate).to be_falsey
      end
    end
  end
end
