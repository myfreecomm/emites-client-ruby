module Emites
  module Entities
    class TakerAddress < Base
      attribute :id,                   Integer
      attribute :street,               String
      attribute :number,               String
      attribute :complement,           String
      attribute :neighborhood,         String
      attribute :city_code,            Integer
      attribute :state,                String
      attribute :zip_code,             String
      attribute :street_type,          String
      attribute :neighborhood_type,    String
      attribute :city,                 String
      attribute :reference_point,      String
      attribute :country,              String
      attribute :country_code,         Integer
      attribute :country_abbreviation, String
    end
  end
end