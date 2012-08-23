# -*- encoding: utf-8 -*-
require File.expand_path('../lib/oozie-client/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Neville Kadwa"]
  gem.email         = ["neville@kadwa.com"]
  gem.description   = %q{Standalone Oozie Client for the Oozie Workflow engine on Hadoop.}
  gem.summary       = %q{Oozie Client for Ruby}
  gem.homepage      = "https://github.com/kadwanev/oozie-client"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "oozie-client"
  gem.require_paths = ["lib"]
  gem.version       = OozieClient::VERSION

  gem.add_dependency('rest-client')
  gem.add_dependency('builder')
end
