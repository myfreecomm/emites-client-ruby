require "spec_helper"

describe Emites::Client do
  let(:token) { "3064F9B4DFFF2FA4287B5D42D7245F40" }
  subject     { described_class.new(token) }

  describe "#emitters" do
    it "returns an instance of Emites::Resources::Emitter" do
      expect(subject.emitters).to be_a(Emites::Resources::Emitter)
    end
  end

end
