# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "emites/version"

Gem::Specification.new do |spec|
  spec.name          = "emites-client"
  spec.version       = Emites::VERSION
  spec.authors       = ["Leandro Thimóteo", "Marcos Tagomori", "Rodrigo Tassinari", "Vagner Zampieri", "Wanderson Policarpo"]
  spec.email         = %w(leandro.thimoteo marcos.tagomori rodrigo.tassinari vagner.zampieri wanderson.policarpo).map { |nick| "#{nick}@myfreecomm.com.br" }
  spec.summary       = %q{Official Ruby client for the Emites API.}
  spec.description   = %q{Official Ruby client for the Emites API. Emites is a system for creating "notas fiscais eletrônicas" (NFe / NFSe) in Brazil.}
  spec.homepage      = "https://github.com/myfreecomm/emites-client-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "typhoeus", "~> 0.7"
  spec.add_dependency "multi_json", "~> 1.9"
  spec.add_dependency "virtus", "~> 1.0"
  spec.add_dependency "wisper", "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rdoc', '~> 4.0'
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "pry-nav", "~> 0.2"
  spec.add_development_dependency "awesome_print", "~> 1.1"
  spec.add_development_dependency "simplecov", "~> 0.9"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.4"
  spec.add_development_dependency "vcr", "~> 2.9"
end
