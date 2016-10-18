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

      protected

      def respond_with_collection(response, naked_klass = entity_klass)
        Emites::Entities::Collection.build(response, naked_klass)
      end

      def respond_with_entity(response, naked_klass = entity_klass)
        naked_klass.new(response.parsed_body)
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
