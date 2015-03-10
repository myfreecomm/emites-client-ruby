require "spec_helper"

describe Emites::Configuration do

  it "uses the production Emites URL by default" do
    expect(subject.url).to eq "https://app.emites.com.br/api/v1"
  end

  it "uses a default user agent" do
    expect(subject.user_agent).to eq "Emites Ruby Client v#{Emites::VERSION}"
  end

end
