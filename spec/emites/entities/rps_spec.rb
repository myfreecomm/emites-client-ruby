require "spec_helper"

describe Emites::Entities::Rps do
  let(:attributes) do
    {
      number:   1,
      serie:    "a",
      rps_type: 1,
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:number, :serie, :rps_type]
end