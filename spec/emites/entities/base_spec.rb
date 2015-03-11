require "spec_helper"

describe Emites::Entities::Base do

  class DummyEntity < Emites::Entities::Base
    ATTRIBUTES = [:property_1, :property_2]
    attr_accessor *ATTRIBUTES
  end

  let(:hash) { {property_1: 1, property_2: 2} }
  subject    { DummyEntity.new(hash) }

  it "builds an object from a hash" do
    expect(subject).to respond_to(:property_1)
    expect(subject).to respond_to(:property_2)
    expect(subject.property_1).to eq(1)
    expect(subject.property_2).to eq(2)
  end

  describe "#to_hash" do
    it "returns a hash from object attributes" do
      expect(subject.to_hash).to eq({
        property_1: 1,
        property_2: 2
      })
    end
  end
end