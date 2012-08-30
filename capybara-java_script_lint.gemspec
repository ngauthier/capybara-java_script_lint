# -*- encoding: utf-8 -*-
require File.expand_path('../lib/capybara/java_script_lint/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nick Gauthier"]
  gem.email         = ["ngauthier@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "capybara-java_script_lint"
  gem.require_paths = ["lib"]
  gem.version       = Capybara::JavaScriptLint::VERSION
  gem.add_dependency 'capybara-webkit'
end
