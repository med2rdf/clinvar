lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clinvar/rdf/version'

Gem::Specification.new do |spec|
  spec.name          = 'clinvar-rdf'
  spec.version       = ClinVar::RDF::VERSION
  spec.authors       = ['Daisuke Satoh']
  spec.email         = ['med2rdf@googlegroups.com']

  spec.summary       = 'RDF converter for ClinVar'
  spec.description   = spec.summary
  spec.homepage      = 'http://med2rdf.org'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.5.0'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    # noinspection RubyQuotedStringsInspection
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) || f.match(%r{^(\.|[Dd]ocker)}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'yard'

  spec.add_dependency 'activesupport', '~> 5.2', '>= 5.2.1'
  spec.add_dependency 'activemodel', '~> 5.2', '>= 5.2.1'
  spec.add_dependency 'logger-application'
  spec.add_dependency 'rdf', '~> 3.0', '>= 3.0.4'
  spec.add_dependency 'rdf-raptor', '~> 2.2.0'
  spec.add_dependency 'rdf-turtle', '~> 3.0', '>= 3.0.3'
  spec.add_dependency 'rdf-vocab', '~> 3.0', '>= 3.0.3'
  spec.add_dependency 'rdf-xsd', '~> 3.0', '>= 3.0.1'
  spec.add_dependency 'soap4r-ng'
  spec.add_dependency 'xml-simple', '~> 1.1'
end
