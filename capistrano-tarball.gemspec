# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "capistrano-tarball"
  spec.version       = "0.1.1"
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

  spec.add_dependency 'capistrano', '>= 3.2.0'
end
