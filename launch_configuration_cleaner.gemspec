# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'launch_configuration_cleaner/version'

Gem::Specification.new do |spec|
  spec.name          = "launch_configuration_cleaner"
  spec.version       = LaunchConfigurationCleaner::VERSION
  spec.authors       = ["ryonext"]
  spec.email         = ["ryonext.s@gmail.com"]

  spec.summary       = %q{Remove AWS LaunchConfiguration quickly.}
  spec.description   = %q{Remove AWS LaunchConfiguration quickly.}
  spec.homepage      = "https://github.com/ryonext/launch_configuration_cleaner"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk", "~> 2.0"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
