module Emites
  class Client
    attr_reader :http

    def initialize(token)
      @http = Http.new(token)
    end

    def authenticated?
      http.get("") do |response|
        response.code == 200
      end
    rescue RequestError => e
      raise e unless e.code == 401
      false
    end

    def emitters
      Resources::Emitter.new(http)
    end

    def webhooks
      Resources::Webhook.new(http)
    end

    def nfse
      Resources::Nfse.new(http)
    end

    def takers
      Resources::Taker.new(http)
    end

    def services
      Resources::Service.new(http)
    end
  end
end
