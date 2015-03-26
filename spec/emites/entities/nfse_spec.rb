require "spec_helper"

describe Emites::Entities::Nfse do
  let(:attributes) do
    {

    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [
    :id, :emitter_id, :taker, :rps_situation, :serie,
    :number, :rps_type, :emission_date,
    :operation_nature, :other_informations,
    :competence, :special_regime, :status,
    :description, :send_nfse_taker, :service_values
  ]
end
