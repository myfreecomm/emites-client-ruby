require "spec_helper"

describe Emites::Entities::Service do
  let(:attributes) do
    {

    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [
    :id, :emitter_id, :name, :service_amount, :calculation_base,
    :deduction_percentage, :retained_iss, :iss_percentage,
    :pis_percentage, :cofins_percentage, :inss_percentage,
    :ir_percentage, :csll_percentage, :discount_conditioning_percentage,
    :service_item_code, :city_tax_code, :cnae_code,
    :description, :city_code, :nfse_liquid_amount,
    :other_retentions_percentage, :retained_iss_percentage, :unconditioned_discount_percentage
  ]
end