module Emites
  module Entities
    class Service < Base
      attribute :id,                                Integer
      attribute :emitter_id,                        Integer
      attribute :name,                              String
      attribute :service_amount,                    Decimal, precision: 16, scale: 2
      attribute :calculation_base,                  Decimal, precision: 16, scale: 2
      attribute :deduction_percentage,              Decimal, precision: 5, scale: 2
      attribute :retained_iss,                      Boolean
      attribute :iss_percentage,                    Decimal, precision: 5, scale: 2
      attribute :pis_percentage,                    Decimal, precision: 5, scale: 2
      attribute :cofins_percentage,                 Decimal, precision: 5, scale: 2
      attribute :inss_percentage,                   Decimal, precision: 5, scale: 2
      attribute :ir_percentage,                     Decimal, precision: 5, scale: 2
      attribute :csll_percentage,                   Decimal, precision: 5, scale: 2
      attribute :discount_conditioning_percentage,  Decimal, precision: 5, scale: 2
      attribute :service_item_code,                 String
      attribute :city_tax_code,                     String
      attribute :cnae_code,                         Integer
      attribute :description,                       String
      attribute :city_code,                         Integer
      attribute :nfse_liquid_amount,                Decimal, precision: 16, scale: 2
      attribute :liquid_amount,                     Decimal, precision: 16, scale: 2
      attribute :other_retentions_percentage,       Decimal, precision: 5, scale: 2
      attribute :retained_iss_percentage,           Decimal, precision: 5, scale: 2
      attribute :unconditioned_discount_percentage, Decimal, precision: 5, scale: 2
      attribute :pis_value,                         Decimal, precision: 16, scale: 2
      attribute :ir_value,                          Decimal, precision: 16, scale: 2
      attribute :inss_value,                        Decimal, precision: 16, scale: 2
      attribute :retained_iss_value,                Decimal, precision: 16, scale: 2
      attribute :other_retentions_value,            Decimal, precision: 16, scale: 2
      attribute :cofins_value,                      Decimal, precision: 16, scale: 2
      attribute :csll_value,                        Decimal, precision: 16, scale: 2
    end
  end
end
