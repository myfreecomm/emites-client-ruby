module Emites
  module Entities
    class NfseStatusTransition < Base
      attribute :id,                Integer
      attribute :token_description, String
      attribute :from_status,       String
      attribute :to_status,         String
      attribute :date,              DateTime
      attribute :emitter,           Emitter
      attribute :rps,               Rps
      attribute :account,           Account
    end
  end
end