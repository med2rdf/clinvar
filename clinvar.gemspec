
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clinvar/version'

Gem::Specification.new do |spec|
  spec.name          = 'clinvar'
  spec.version       = Clinvar::VERSION
  spec.authors       = ['Daisuke Satoh']
  spec.email         = ['med2rdf@googlegroups.com']

  spec.summary       = 'RDF converter for ClinVar'
  spec.description   = spec.summary
  spec.homepage      = 'http://med2rdf.org'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.5.0'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
