# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'akshar/version'

Gem::Specification.new do |spec|
  spec.name          = "akshar"
  spec.version       = Akshar::VERSION
  spec.authors       = ["Anup Neupane"]
  spec.email         = ["anupbrt@outlook.com"]

  spec.summary       = %q{Change Numbers to Nepali Names .i.e aanka to akshar ( अंक टु अक्षर )}
  spec.description   = %q{ Akshar(अक्षर). This Gem will change Numbers to Nepali Names. example 100.to_akshar = "रुपैयाँ एक सय मात्र ।"}
  spec.homepage      = "https://github.com/anupbrt/akshar"
  spec.license       = "MIT"



  #spec.add_dependency      "activesupport"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  
end
