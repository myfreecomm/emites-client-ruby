require "emites/resources/hooks"

module Emites
  module Resources
    class Base
      include Wisper::Publisher
      extend Hooks

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

      def respond_with_collection(response, naked_klass = entity_klass)
        hash = parsed_body(response)
        hash["collection"].map do |item|
          naked_klass.new(item)
        end
      end

      def respond_with_entity(response, naked_klass = entity_klass)
        item = parsed_body(response)
        naked_klass.new(item)
      end

      def base_klass
        @base_klass ||= self.class.name.split("::").last
      end

      def entity_klass
        @entity_klass ||= Emites::Entities.const_get(base_klass.to_sym)
      end

    end
  end
end