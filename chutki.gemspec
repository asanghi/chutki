# -*- encoding: utf-8 -*-
require File.expand_path('../lib/chutki/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Aditya Sanghi"]
  gem.email         = ["aditya.sanghi@risingsuntech.net"]
  gem.description   = %q{Sends SMS thru a web api}
  gem.summary       = %q{Your SMS provider has given you an endpoint which you must call to Send SMS. Chutki makes it easy.}
  gem.homepage      = "https://github.com/asanghi/chutki"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "chutki"
  gem.require_paths = ["lib"]
  gem.version       = Chutki::VERSION

  gem.add_runtime_dependency "httparty", ">= 0.5.2"

end
