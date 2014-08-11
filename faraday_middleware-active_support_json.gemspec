# -*- encoding: utf-8 -*-
#
Gem::Specification.new do |gem|
  gem.authors       = ['Dennis Rogenius', 'David Butler']
  gem.email         = ['dwbutler@ucla.edu']
  gem.description   = %q{Faraday middleware for handling JSON using ActiveSupport::JSON}
  gem.summary       = %q{JSON request generator and response parser using ActiveSupport::JSON and FaradayMiddleware}
  gem.homepage      = 'https://github.com/dwbutler/faraday_middleware-active_support_json'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'faraday_middleware-active_support_json'
  gem.require_paths = ['lib']
  gem.version       = '0.0.2'

  gem.add_dependency 'faraday_middleware'
  gem.add_dependency 'activesupport', '> 3', '< 5'

  gem.add_development_dependency 'rspec'
end
