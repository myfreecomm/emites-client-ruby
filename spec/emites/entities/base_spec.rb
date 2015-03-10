require "spec_helper"

describe Emites::Entities::Base do

  class DummyEntity < Emites::Entities::Base;  end

  let(:hash) { {property_1: 1, property_2: 2} }

  it "builds an object from a hash" do
    subject = DummyEntity.new(hash)
    expect(subject).to respond_to(:property_1)
    expect(subject).to respond_to(:property_2)
    expect(subject.property_1).to eq(1)
    expect(subject.property_2).to eq(2)
  end

  it "builds an object within only certain properties from hash" do
    allow_any_instance_of(DummyEntity).to receive(:buildable_properties).and_return([:property_2])
    subject = DummyEntity.new(hash)
    expect(subject).to respond_to(:property_2)
    expect(subject.property_2).to eq(2)
    expect(subject).not_to respond_to(:property_1)
    expect{ subject.property_1 }.to raise_error
  end
end