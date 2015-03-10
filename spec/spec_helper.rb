require "simplecov"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
]
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "emites"
require "pry"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :typhoeus
end

RSpec.configure do |config|
  config.mock_with :rspec

  config.before(:each) do
    Emites.configuration.url = "https://sandbox.emites.com.br/api/v1"
  end
end

