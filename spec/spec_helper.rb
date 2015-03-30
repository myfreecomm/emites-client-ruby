require "codeclimate-test-reporter"
require "simplecov"

CodeClimate::TestReporter.start

SimpleCov.start do
  SimpleCov.maximum_coverage_drop 0.2
  SimpleCov.start do
    add_group  "Resources", "lib/emites/resources"
    add_group  "Entities",  "lib/emites/entities"
    add_filter "vendor"
  end
end

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "emites"
require "pry"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :typhoeus
  config.ignore_hosts "codeclimate.com"
end

Dir["spec/support/**/*.rb"].each { |f| load f }
Dir["spec/shared_examples/**/*.rb"].each { |f| load f }

RSpec.configure do |config|
  config.mock_with :rspec

  config.before(:each) do
    Emites.configuration.url = "https://sandbox.emites.com.br/api/v1"
    Typhoeus::Expectation.clear
  end
end

