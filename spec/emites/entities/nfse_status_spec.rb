require "spec_helper"

describe Emites::Entities::NfseStatus do
  let(:attributes) do
    {

    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [
    :id, :status, :description, :nfse_key, :nfse_number,
    :number, :mirror, :xml, :errors
  ]
end
