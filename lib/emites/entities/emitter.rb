require "emites/entities/base"

module Emites
  module Entities
    class Emitter < Base
      ATTRIBUTES = [:city, :certificate_filename, :id, :account_id,
        :email, :cnpj, :social_reason, :fancy_name, :state_inscription,
        :city_inscription, :neighborhood, :street, :number, :complement,
        :zip_code, :phone, :national_simple_optant, :cultural_promoter,
        :is_active, :environment, :latest_serie, :latest_number,
        :country_code, :street_type
      ]

      attr_accessor *ATTRIBUTES
    end
  end
end