require "spec_helper"

describe Emites::Entities::Taker do
  let(:attributes) do
    {

    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [
    :cpf, :cnpj, :city_inscription, :social_reason,
    :fancy_name, :state_inscription, :substitute_state_inscription,
    :special_situation, :foreign_taker, :allow_incomplete,
    :is_complete, :address, :contact
  ]
end