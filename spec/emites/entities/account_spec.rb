require "spec_helper"

describe Emites::Entities::Account do
  let(:attributes) do
    {
      id:   1,
      name: "Pull4up-NFSE"
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [:id, :name]
end