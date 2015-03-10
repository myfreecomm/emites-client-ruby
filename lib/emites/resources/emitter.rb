module Emites::Resources
  class Emitter
    attr_accessor :client

    def initialize(client)
      @client = client
    end

    def search
      request = Typhoeus::Request.new(
        "#{Emites.configuration.url}/emitters",
        method: :get,
        userpwd: "#{client.token}:x",
      )
      request.run
      build_collection(request.response)
    rescue

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
