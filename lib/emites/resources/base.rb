module Emites
  module Resources
    class Base
      attr_accessor :http

      def initialize(http)
        @http = http
      end

      def parsed_body(response)
        MultiJson.load(response.body)
      rescue MultiJson::ParseError
        {}
      end

      protected

      def respond_with_collection(response)
        hash = parsed_body(response)
        hash["collection"].map do |item|
          build_item(item)
        end
      end

      def respond_with_entity(response)
        item = parsed_body(response)
        build_item(item)
      end

      def build_item(item)
        entity_klass = Emites::Entities.const_get(base_klass)
        entity_klass.new(item)
      end

      def base_klass
        self.class.name.split("::").last.to_sym
      end

    end
  end
end
