require "emites/request"
require "emites/response"

module Emites
  class Http
    attr_reader :token

    def initialize(token)
     @token = token
    end

    %w[get post delete put patch].each do |m|
      define_method(m) do |path, options = {}, &block|
        send_request(m.to_sym, path, options, &block)
      end
    end

    private

    def send_request(method, path, options, &block)
      request  = Request.new(options.merge!({
        method:     method,
        token:      token,
        url:        "#{Emites.configuration.url}#{path}",
        user_agent: Emites.configuration.user_agent
      }))

      response = Response.new(request.run)

      response.resolve!(&block)
    end

  end
end
