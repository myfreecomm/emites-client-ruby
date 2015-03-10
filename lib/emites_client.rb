require 'rest_client'
require 'multi_json'

require "emites_client/version"
require "emites_client/configuration"

module EmitesClient
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end
end
