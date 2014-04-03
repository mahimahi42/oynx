# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oynx/version'

Gem::Specification.new do |spec|
  spec.name          = "oynx"
  spec.version       = Oynx::VERSION
  spec.authors       = ["Bryce Davis"]
  spec.email         = ["me@bryceadavis.com"]
  spec.summary       = %q{Oynx WebDev Helper}
  spec.description   = %q{Oynx simplifies several aspects of web development}
  spec.homepage      = "https://github.com/mahimahi42/oynx.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["oynx"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency "rubyzip"
end

