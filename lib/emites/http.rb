# TODO: refactor
module Emites
  RequestTimeout = Class.new(StandardError)
  RequestError   = Class.new(StandardError)

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
      options.merge!(method: method)
      request = request(path, build_options(options))
      request.run
      resolve_response!(request.response, &block)
    end

    def request(path, options)
      Typhoeus::Request.new(
        "#{Emites.configuration.url}#{path}",
        options
      )
    end

    def build_options(options)
      {
        userpwd:  "#{token}:x",
        headers:  {
          "Accept"        => "application/json",
          "Content-Type"  => "application/json",
          "User-Agent"    => Emites.configuration.user_agent
        }
      }.merge(options)
    end

    def resolve_response!(response, &block)
      if response.success?
        body = response_body(response.body)

        block_given? ? yield(body) :body
      elsif response.timed_out?
        raise RequestTimeout
      else
        raise request_error(response)
      end
    end

    def response_body(body)
      MultiJson.load(body)
    rescue MultiJson::ParseError
      {}
    end

    def request_error(response)
      RequestError.new(
        code:     response.code,
        message:  response.status_message,
        body:     response.body
      )
    end
  end
end
