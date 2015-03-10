require "spec_helper"

describe EmitesClient do

  it "has a version number" do
    expect(EmitesClient::VERSION).not_to be_nil
  end

  describe ".configuration" do
    it "is done via block initialization" do
      EmitesClient.configure do |c|
        c.url = 'http://some/where'
        c.user_agent = 'My App v1.0'
      end
      expect(EmitesClient.configuration.url).to eq 'http://some/where'
      expect(EmitesClient.configuration.user_agent).to eq 'My App v1.0'
    end
    it "uses a singleton object for the configuration values" do
      config1 = EmitesClient.configuration
      config2 = EmitesClient.configuration
      expect(config1).to eq config2
    end
  end

end
