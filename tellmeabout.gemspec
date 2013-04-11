# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tellmeabout/version'

Gem::Specification.new do |spec|
  spec.name          = "tellmeabout"
  spec.version       = Tellmeabout::VERSION
  spec.authors       = ["Luke Griffiths"]
  spec.email         = ["wlgriffiths@gmail.com"]
  spec.description   = %q{Wikipedia article reader}
  spec.summary       = %q{Talks to you about any topic you want}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
