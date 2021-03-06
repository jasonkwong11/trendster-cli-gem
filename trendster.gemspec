# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trendster/version'

Gem::Specification.new do |spec|
  spec.name          = "trendster"
  spec.date          = '2016-10-11'
  spec.version       = Trendster::VERSION
  spec.authors       = ["Jason Kwong"]
  spec.email         = ["jasonkwong11@gmail.com"]

  spec.summary       = "CLI interface to Cuyahoga County Public Library events."
  spec.description   = "Provides details of upcoming events at library with CLI interface."
  spec.homepage      = "https://github.com/jasonkwong11/trendster-cli-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   << 'trendster'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "nokogiri"
end
