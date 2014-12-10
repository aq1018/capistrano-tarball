# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/tarball/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-tarball"
  spec.version       = Capistrano::Tarball::VERSION
  spec.authors       = ["Aaron Qian"]
  spec.email         = ["aq1018@gmail.com"]
  spec.summary       = %q{Capistrano tarball strategy}
  spec.description   = %q{Deploy your apps via tarball instead of scm}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'capistrano', '~> 3.2.1'
end
