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
          build_property(property, value) if buildable?(property)
        end
      end

      def build_property(property, value)
        self.define_singleton_method(property) do
          value
        end unless respond_to?(property)
      end

      def buildable?(property)
        buildable_properties == :all || buildable_properties.include?(property)
      end

      def buildable_properties
        :all
      end

    end
  end
end