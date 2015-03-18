module Emites
  module Entities
    class NfseValues < Base
      attribute :service_amount,                 Decimal, precision: 16, scale: 2
      attribute :calculation_base,               Decimal, precision: 16, scale: 2
      attribute :deduction_amount,               Decimal, precision: 16, scale: 2
      attribute :retained_iss,                   Boolean
      attribute :iss_percentage,                 Decimal, precision: 16, scale: 2
      attribute :iss_amount,                     Decimal, precision: 16, scale: 2
      attribute :pis_amount,                     Decimal, precision: 16, scale: 2
      attribute :cofins_amount,                  Decimal, precision: 16, scale: 2
      attribute :inss_amount,                    Decimal, precision: 16, scale: 2
      attribute :ir_amount,                      Decimal, precision: 16, scale: 2
      attribute :csll_amount,                    Decimal, precision: 16, scale: 2
      attribute :discount_conditioning_amount,   Decimal, precision: 16, scale: 2
      attribute :service_item_code,              String
      attribute :city_tax_code,                  String
      attribute :cnae_code,                      Integer
      attribute :description,                    String
      attribute :city_code,                      Integer
      attribute :nfse_liquid_amount,             Decimal, precision: 16, scale: 2
      attribute :other_retentions_amount,        Decimal, precision: 16, scale: 2
      attribute :retained_iss_amount,            Decimal, precision: 16, scale: 2
      attribute :unconditioned_discount_amount,  Decimal, precision: 16, scale: 2
    end
  end
end