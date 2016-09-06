require "typhoeus"
require "multi_json"
require "wisper"

require "emites/version"
require "emites/configuration"
require "emites/http"
require "emites/client"
require "emites/params"

require "emites/entities/base"
require "emites/entities/collection"
require "emites/entities/account"
require "emites/entities/emitter"
require "emites/entities/taker_address"
require "emites/entities/taker_contact"
require "emites/entities/taker"
require "emites/entities/rps"
require "emites/entities/nfse_status"
require "emites/entities/nfse_status_transition"
require "emites/entities/nfse_values"
require "emites/entities/nfse"
require "emites/entities/webhook"
require "emites/entities/service"

require "emites/resources/base"
require "emites/resources/emitter"
require "emites/resources/webhook"
require "emites/resources/nfse"
require "emites/resources/taker"
require "emites/resources/service"

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

  def self.subscribe(event, callback)
    Wisper.subscribe(callback, on: event, with: :call)
  end
end
