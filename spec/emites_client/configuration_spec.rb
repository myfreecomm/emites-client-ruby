require "spec_helper"

describe EmitesClient::Configuration do

  it "uses the production EmitesClient URL by default" do
    expect(subject.url).to eq "https://app.emites.com.br/api/v1"
  end

  it "uses a default user agent" do
    expect(subject.user_agent).to eq "EmitesClient Ruby Client v#{EmitesClient::VERSION}"
  end

end
