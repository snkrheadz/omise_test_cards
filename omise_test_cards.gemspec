# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omise_test_cards/version"

Gem::Specification.new do |spec|
  spec.name          = "omise_test_cards"
  spec.version       = OmiseTestCards::VERSION
  spec.authors       = ["akinrt"]
  spec.email         = ["aki.d.sc@gmail.com"]
  spec.summary       = %q{Omise test cards for omise api in test mode.}
  spec.description   = %q{A set of common test cards for omise api in test mode.}
  spec.homepage      = "https://github.com/akinrt/omise_test_cards"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "hashie", "~> 3.5.5"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
