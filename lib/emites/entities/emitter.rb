module Emites
  module Entities
    class Emitter < Base
      attribute :id,                      Integer
      attribute :email,                   String
      attribute :social_reason,           String
      attribute :cnpj,                    String
      attribute :fancy_name,              String
      attribute :state_inscription,       String
      attribute :city_inscription,        String
      attribute :state,                   String
      attribute :city,                    String
      attribute :neighborhood,            String
      attribute :street_type,             String
      attribute :street,                  String
      attribute :number,                  String
      attribute :zip_code,                String
      attribute :complement,              String
      attribute :phone,                   String
      attribute :certificate,             String
      attribute :password,                String
      attribute :environment,             String
      attribute :filename,                String
      attribute :latest_serie,            String
      attribute :latest_number,           Integer
      attribute :code_tax_regime,         Integer
      attribute :national_simple_optant,  Boolean
      attribute :cultural_promoter,       Boolean
    end
  end
end