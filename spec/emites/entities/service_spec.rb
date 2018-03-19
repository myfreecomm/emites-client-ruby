require "spec_helper"

describe Emites::Entities::Service do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes",
                  [
                    :id, :emitter_id, :name, :service_amount, :calculation_base,
                    :deduction_percentage, :retained_iss, :iss_percentage,
                    :pis_percentage, :cofins_percentage, :inss_percentage,
                    :ir_percentage, :csll_percentage, :discount_conditioning_percentage,
                    :service_item_code, :city_tax_code, :cnae_code,
                    :description, :city_code, :nfse_liquid_amount,
                    :liquid_amount, :other_retentions_percentage, :retained_iss_percentage,
                    :unconditioned_discount_percentage, :pis_rate, :pis_value,
                    :ir_rate, :ir_value, :inss_rate, :inss_value,
                    :retained_iss_rate, :retained_iss_value,
                    :other_retentions_rate, :other_retentions_value,
                    :cofins_rate, :cofins_value, :csll_rate, :csll_value
                  ]
end
