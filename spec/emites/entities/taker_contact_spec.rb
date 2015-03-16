require "spec_helper"

describe Emites::Entities::TakerContact do
  let(:attributes) do
    {

    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:phone, :email]
end