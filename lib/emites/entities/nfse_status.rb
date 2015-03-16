module Emites
  module Entities
    class NfseStatus < Base
      attribute :id,          Integer
      attribute :status,      String
      attribute :description, String
      attribute :nfse_key,    String
      attribute :nfse_number, String
      attribute :number,      Integer
      attribute :mirror,      String
      attribute :xml,         String
      attribute :errors,      Array
    end
  end
end