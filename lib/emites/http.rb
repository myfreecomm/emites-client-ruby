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
        headers:  build_headers(options),
        body:     build_body(options),
        params:   options[:params],
        method:   options[:method]
      }.reject {|k,v| v.nil?}
    end

    def build_body(options)
      body = options[:body]
      body = MultiJson.dump(body) if body.is_a?(Hash)
      body
    end

    def build_headers(options)
      headers = options.fetch(:headers) { {} }

      {
        "Accept"        => "application/json",
        "Content-Type"  => "application/json",
        "User-Agent"    => Emites.configuration.user_agent
      }.merge(headers)
    end

    def resolve_response!(response, &block)
      if response.success?
        block_given? ? yield(response) : response
      elsif response.timed_out?
        raise RequestTimeout
      else
        raise request_error(response)
      end
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
