require "typhoeus"
require "multi_json"

require "emites/version"
require "emites/configuration"
require "emites/http"
require "emites/client"

require "emites/entities/base"
require "emites/entities/emitter"
require "emites/entities/webhook"
require "emites/entities/taker_address"
require "emites/entities/taker_contact"
require "emites/entities/taker"
require "emites/entities/nfse"
require "emites/entities/nfse_status"

require "emites/resources/base"
require "emites/resources/emitter"
require "emites/resources/webhook"
require "emites/resources/nfse"


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
