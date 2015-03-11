module Emites
  module Entities
    class Base

      def initialize(hash)
        objectify_hash(hash)
        after_initialize(hash)
      end

      protected

      def after_initialize(hash)
      end

      def objectify_hash(hash)
        hash.each do |property, value|
          build_property(property, value)
        end
      end

      def build_property(property, value)
        setter = "#{property}="
        send(setter, value) if respond_to?(setter)
      end

    end
  end
end