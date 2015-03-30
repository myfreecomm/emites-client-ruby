require "emites/exception"

module Emites
  RequestTimeout = Class.new(Exception)
  RequestError   = Class.new(Exception)

  class Response < SimpleDelegator

    def resolve!(&block)
      if success? || redirected?
        block_given? ? yield(self) : self
      elsif timed_out?
        timeout!
      else
        error!
      end
    end

    def redirected?
      response_code && response_code >= 300 && response_code < 400
    end

    private

    def timeout!
      raise RequestTimeout
    end

    def error!
      raise RequestError.new(
        code:    code,
        message: status_message,
        body:    (MultiJson.load(body) rescue {})
      )
    end

  end
end