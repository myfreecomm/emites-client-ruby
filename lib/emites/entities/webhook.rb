module Emites
  module Entities
    class Webhook < Base
      attribute :id,    Integer
      attribute :name,  String
      attribute :url,   String
    end
  end
end