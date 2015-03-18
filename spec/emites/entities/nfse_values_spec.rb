require "spec_helper"

describe Emites::Entities::NfseValues do
  let(:attributes) do
    {

    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes", [
    :service_amount, :calculation_base, :deduction_amount, :retained_iss,
    :iss_percentage, :iss_amount, :pis_amount, :cofins_amount, :inss_amount,
    :ir_amount, :csll_amount, :discount_conditioning_amount, :service_item_code,
    :city_tax_code, :cnae_code, :description, :city_code, :nfse_liquid_amount,
    :other_retentions_amount, :retained_iss_amount, :unconditioned_discount_amount
  ]
end
