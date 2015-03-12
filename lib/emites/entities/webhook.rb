module Emites
  module Entities
    class Webhook < Base
      ATTRIBUTES = [:id, :url, :name]

      attr_accessor *ATTRIBUTES
    end
  end
end