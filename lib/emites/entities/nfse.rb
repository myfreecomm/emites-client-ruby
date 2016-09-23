module Emites
  module Entities
    class Nfse < Base
      attribute :id,                  Integer
      attribute :emitter_id,          Integer
      attribute :taker,               Taker
      attribute :rps_situation,       Integer
      attribute :serie,               String
      attribute :number,              Integer
      attribute :nfse_number,         Integer
      attribute :rps_type,            Integer
      attribute :emission_date,       DateTime
      attribute :emission_date_nfse,  DateTime
      attribute :operation_nature,    Integer
      attribute :other_informations,  String
      attribute :competence,          Date
      attribute :special_regime,      Integer
      attribute :status,              String
      attribute :description,         String
      attribute :send_nfse_taker,     Boolean
      attribute :service_values,      NfseValues
      attribute :_links,              Array

      def url(action)
        links = self._links || []
        link  = links.find { |link| link["rel"].to_s == action.to_s } || {}
        link.fetch("href") { "" }
      end
    end
  end
end
