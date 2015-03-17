module Emites
  class Client
    attr_reader :http

    def initialize(token)
      @http = Http.new(token)
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
  end
end
