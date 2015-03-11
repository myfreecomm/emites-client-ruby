require "spec_helper"

describe Emites::Entities::Base do

  class DummyEntity < Emites::Entities::Base
    attr_accessor :property_1, :property_2
  end

  let(:hash) { {property_1: 1, property_2: 2} }

  it "builds an object from a hash" do
    subject = DummyEntity.new(hash)
    expect(subject).to respond_to(:property_1)
    expect(subject).to respond_to(:property_2)
    expect(subject.property_1).to eq(1)
    expect(subject.property_2).to eq(2)
  end
end