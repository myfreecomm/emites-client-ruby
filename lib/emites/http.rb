module Emites
  # TODO spec
  class Http
    attr_reader :token

    def initialize(token)
     @token = token
    end

    def get(path, &block)
      send_request(:get, path, &block)
    end

    private

    def send_request(method, path)
      request = Typhoeus::Request.new(
        "#{Emites.configuration.url}#{path}",
        method: method,
        userpwd: "#{token}:x",
      )
      request.run
      response = request.response
      return yield(response) if block_given?
      response
    end
  end
end
