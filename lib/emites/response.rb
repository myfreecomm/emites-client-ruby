module Emites
  RequestTimeout = Class.new(StandardError)
  RequestError   = Class.new(StandardError)

  class Response < SimpleDelegator

    def resolve!(&block)
      if success?
        block_given? ? yield(self) : self
      elsif timed_out?
        timeout!
      else
        error!
      end
    end

    private

    def timeout!
      raise RequestTimeout
    end

    def error!
      raise RequestError.new(
        code:    code,
        message: status_message,
        body:    body
      )
    end

  end
end