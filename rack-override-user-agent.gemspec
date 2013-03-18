# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "rack-override-user-agent"
  spec.version       = "0.1.0"
  spec.authors       = ["ryooo321"]
  spec.email         = ["ryooo.321@gmail.com"]
  spec.description   = %q{Override useragent by cookie, switch agent by query.}
  spec.summary       = %q{Override useragent by cookie, switch agent by query.}
  spec.homepage      = "https://github.com/ryooo321/rack-override-user-agent"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'rack'
end
