module Emites
  class Client
    attr_reader :http

    def initialize(token)
      @http = Http.new(token)
    end

    def emitters
      Resources::Emitter.new(http)
    end
  end
end
