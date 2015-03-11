module Emites::Resources
  class Emitter
    attr_reader :http

    def initialize(http)
      @http = http
    end

    def list
      http.get("/emitters") do |response|
        build_collection(response)
      end
    end

    private

    def build_collection(response)
      hash = MultiJson.load(response.body)
      hash["collection"].map do |item|
        build_entity(item)
      end
    end

    def build_entity(item)
      OpenStruct.new(id: item["id"])
    end
  end
end
