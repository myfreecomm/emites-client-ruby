require "simplecov"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
]
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "emites_client"
require "pry"

RSpec.configure do |c|
  c.mock_with :rspec
end
