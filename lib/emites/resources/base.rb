module Emites
  module Resources
    class Base
      attr_accessor :http

      def initialize(http)
        @http = http
      end

      protected

      def respond_with_collection(response)
        hash = parse_body!(response)
        hash["collection"].map do |item|
          build_item(item)
        end
      end

      def respond_with_entity(response)
        item = parse_body!(response)
        build_item(item)
      end

      def build_item(item)
        entity_klass = Emites::Entities.const_get(base_klass)
        entity_klass.new(item)
      end

      def base_klass
        self.class.name.split("::").last.to_sym
      end

      def parse_body!(response)
        begin
          MultiJson.load(response.body)
        rescue MultiJson::ParseError
          {}
        end
      end

    end
  end
end