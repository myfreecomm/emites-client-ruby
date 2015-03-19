module Emites
  class Exception < StandardError
    attr_accessor :code, :body

    def initialize(args = {})
      @code = args[:code]
      @body = args[:body]
    end
  end
end