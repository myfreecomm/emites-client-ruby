require "emites/exception"

module Emites
  RequestTimeout = Class.new(Exception)
  RequestError   = Class.new(Exception)

  class Response < SimpleDelegator

    def resolve!(&block)
      timeout! if timed_out?
      if(success? || redirected?)
        block_given? ? yield(self) : self
      else
        error!
      end
    end

    def redirected?
      (300..308).include?(self.code)
    end

    def parsed_body
      MultiJson.load(body)
    rescue MultiJson::ParseError
      {}
    end

    private

    def timeout!
      raise RequestTimeout
    end

    def error!
      raise RequestError.new(
        code:    code,
        message: status_message,
        body:    parsed_body
      )
    end

  end
end
