#!/usr/bin/env ruby

require 'bundler/setup'
require 'clinvar/rdf'

require 'benchmark'
require 'rdf'
require 'rdf/raptor'
require 'xmlsimple'

Benchmark.bm(7) do |x|

  record = nil
  x.report('read:') do
    record = XmlSimple.xml_in(File.read('spec/sample/VCV000018390.xml'))
  end

  base    = 'http://identifiers.org/clinvar:'
  subject = RDF::URI.new(base + '000018390')

  model = nil
  x.report('build:') do
    model = ClinVar::RDF::Model::VariationArchiveType.build(record).subject(subject)
  end

  puts RDF::Writer.for(:ttl)
  x.report('buffer:') do
    RDF::Writer.for(:ttl).buffer(base_uri: base, prefixes: {
      cvo: 'http://purl.jp/bio/10/clinvar/',
      xsd: 'http://www.w3.org/2001/XMLSchema#'
    }) do |writer|
      writer << model
    end
  end
end
