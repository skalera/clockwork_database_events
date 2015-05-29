# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clockwork_database_events/version'

Gem::Specification.new do |spec|
  spec.name          = 'clockwork_database_events'
  spec.version       = ClockworkDatabaseEvents::VERSION
  spec.authors       = ['Martin Englund']
  spec.email         = ['martin@englund.nu']

  spec.summary       = 'Simple database event model for clockwork'
  spec.homepage      = 'http://skalera.com/'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(spec)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'sequel', '~> 4'
  spec.add_runtime_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1'
  spec.add_development_dependency 'rake', '~> 10'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'pry'
end
