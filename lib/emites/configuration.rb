require "base64"

module Emites
  class Configuration
    attr_accessor :url, :user_agent

    def initialize
      @url = "https://app.emites.com.br/api/v1"
      @user_agent = "Emites Ruby Client v#{Emites::VERSION}"
    end
  end
end
