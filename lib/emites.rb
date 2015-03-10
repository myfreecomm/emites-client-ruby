require "multi_json"

require "emites/version"
require "emites/configuration"
require "emites/client"

require "emites/resources/emitter"

require "emites/entities/emitter"
require "emites/entities/taker"

module Emites
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end
end
