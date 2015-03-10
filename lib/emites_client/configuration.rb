require "base64"

module EmitesClient
  class Configuration
    attr_accessor :url, :user_agent

    def initialize
      @url = "https://app.emites.com.br/api/v1"
      @user_agent = "EmitesClient Ruby Client v#{EmitesClient::VERSION}"
    end
  end
end
