module Emites
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

      body =  begin
                MultiJson.load(request.response.body)
              rescue MultiJson::ParseError
                {}
              end

      return yield(body) if block_given?
      body
    end
  end
end
