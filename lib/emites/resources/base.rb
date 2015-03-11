module Emites
  module Resources
    class Base
      attr_accessor :http

      def initialize(http)
        @http = http
      end

      protected

      def build_collection(hash)
        hash["collection"].map do |item|
          build_entity(item)
        end
      end

      def build_entity(item)
        entity_klass = Emites::Entities.const_get(base_klass)
        entity_klass.new(item)
      end

      def base_klass
        self.class.name.split("::").last.to_sym
      end

    end
  end
end