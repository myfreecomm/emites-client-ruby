module Emites
  module Entities
    class Nfse < Base
      attribute :id,                  Integer
      attribute :emitter_id,          Integer
      attribute :taker,               Taker
      attribute :rps_situation,       Integer
      attribute :serie,               String
      attribute :number,              Integer
      attribute :rps_type,            Integer
      attribute :emission_date,       DateTime
      attribute :operation_nature,    Integer
      attribute :other_informations,  String
      attribute :competence,          Date
      attribute :special_regime,      Integer
      attribute :status,              String
      attribute :description,         String
      attribute :send_nfse_taker,     Boolean
      attribute :service_values,      NfseValues
    end
  end
end