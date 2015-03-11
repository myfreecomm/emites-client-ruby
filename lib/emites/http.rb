# TODO: refactor
module Emites
  RequestTimeout = Class.new(StandardError)
  RequestError   = Class.new(StandardError)

  class Http
    attr_reader :token

    def initialize(token)
     @token = token
    end

    def get(path, options = {}, &block)
      send_request(:get, path, options, &block)
    end

    def post(path, options = {}, &block)
      send_request(:post, path, options, &block)
    end

    def delete(path, options = {}, &block)
      send_request(:delete, path, options, &block)
    end

    def put(path, options = {}, &block)
      send_request(:put, path, options, &block)
    end

    def patch(path, options = {}, &block)
      send_request(:patch, path, options, &block)
    end

    private

    def send_request(method, path, options, &block)
      options.merge!(method: method)
      request = Typhoeus::Request.new("#{Emites.configuration.url}#{path}", build_options(options))
      request.run
      resolve_response!(request.response, &block)
    end

    def build_options(options)
      {
        userpwd:  "#{token}:x",
        headers:  {
          "Accept"      => "application/json",
          "User-Agent"  => Emites.configuration.user_agent
        }
      }.merge(options)
    end

    def resolve_response!(response, &block)
      if response.success?
        body =  begin
                  MultiJson.load(response.body)
                rescue MultiJson::ParseError
                  {}
                end

        block_given? ? yield(body) :body
      elsif response.timed_out?
        raise RequestTimeout
      else
        raise RequestError.new(code: response.code, message: response.status_message)
      end
    end

  end
end
