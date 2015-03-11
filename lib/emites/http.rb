# TODO spec
module Emites
  class Http
    attr_reader :token

    def initialize(token)
     @token = token
    end

    def get(path)
      send_request(:get, path)
    end

    private

    def send_request(method, path)
      request = Typhoeus::Request.new(
        "#{Emites.configuration.url}#{path}",
        method: method,
        userpwd: "#{token}:x",
      )
      request.run
      request.response
    end
  end
end
