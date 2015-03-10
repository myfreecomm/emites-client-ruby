module Emites
  class Client
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def authenticate
      request = Typhoeus::Request.new(
        Emites.configuration.url,
        method: :get,
        userpwd: "#{token}:x",
      )
      request.run
      request.response.code == 200
    end

  end
end
