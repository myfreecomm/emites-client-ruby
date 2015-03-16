module Emites
  module Entities
    class Taker < Base
      attribute :cpf,                           String
      attribute :cnpj,                          String
      attribute :city_inscription,              String
      attribute :social_reason,                 String
      attribute :fancy_name,                    String
      attribute :state_inscription,             String
      attribute :substitute_state_inscription,  String
      attribute :special_situation,             Integer
      attribute :foreign_taker,                 Boolean
      attribute :allow_incomplete,              Boolean
      attribute :is_complete,                   Boolean
      attribute :address,                       TakerAddress
      attribute :contact,                       TakerContact
    end
  end
end