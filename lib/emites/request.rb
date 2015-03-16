module Emites
  class Request

    def initialize(options)
      @options = options
    end

    def run
      request.run
      request.response
    end

    private

    attr_reader :options

    def request
      @request ||= Typhoeus::Request.new(options[:url], build_options)
    end

    def build_options
      {
        method:   options[:method],
        userpwd:  "#{options[:token]}:x",
        headers:  build_headers,
        body:     build_body,
        params:   options[:params],
      }.reject {|k,v| v.nil?}
    end

    def build_headers
      headers = options.fetch(:headers) { {} }

      {
        "Accept"        => "application/json",
        "Content-Type"  => "application/json",
        "User-Agent"    => options[:user_agent]
      }.merge(headers)
    end

    def build_body
      body = options[:body]
      body = MultiJson.dump(body) if body.is_a?(Hash)
      body
    end

  end
end