# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kakegane/version'

Gem::Specification.new do |spec|
  spec.name          = 'kakegane'
  spec.version       = Kakegane::VERSION
  spec.authors       = ['Matt Blewitt']
  spec.email         = ['blewitt.matt@gmail.com']

  spec.summary       = 'Naive countdown latch implementation'
  spec.description   = 'Naive countdown latch implementation'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`
                       .split("\x0")
                       .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.40.0'
  spec.add_development_dependency 'yard', '~> 0.8.7.6'
  spec.add_development_dependency 'coveralls'
end
