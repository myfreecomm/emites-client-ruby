module Emites
  class Client
    attr_reader :http

    #
    #  client = Emites::Client.new(token)
    #  emitters = client.emitters.list
    #
    def initialize(token)
      @http = Http.new(token)
    end

    def emitters
      Resources::Emitter.new(http)
    end
  end
end