require "typhoeus"
require "multi_json"

require "emites/version"
require "emites/configuration"
require "emites/http"
require "emites/client"

require "emites/entities/base"
require "emites/entities/emitter"
require "emites/entities/webhook"
require "emites/entities/taker"

require "emites/resources/base"
require "emites/resources/emitter"
require "emites/resources/webhook"


module Emites
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.client(token)
    Client.new(token)
  end
end
