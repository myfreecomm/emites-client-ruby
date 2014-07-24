# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emites_client/version'

Gem::Specification.new do |spec|
  spec.name          = "emites_client"
  spec.version       = EmitesClient::VERSION
  spec.authors       = ["Rodrigo Tassinari de Oliveira"]
  spec.email         = ["rodrigo.tassinari@myfreecomm.com.br"]
  spec.summary       = %q{Official Ruby client for the Emites API.}
  spec.description   = %q{Official Ruby client for the Emites API. Emites is a system for creating "notas fiscais eletrônicas" (NFe / NFSe) in Brazil.}
  spec.homepage      = "https://github.com/myfreecomm/emites-client-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
