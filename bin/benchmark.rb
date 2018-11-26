#!/usr/bin/env ruby

require 'bundler/setup'
require 'clinvar/rdf'

require 'benchmark'
require 'rdf'
require 'xmlsimple'

require 'clinvar/rdf/refiner'

puts RDF::Writer.for(:ttl)

io = StringIO.new
Benchmark.bm(7) do |x|

  record = nil
  x.report('read:') do
    record = XmlSimple.xml_in(File.read('spec/sample/VCV000018390.xml'))
  end

  model = nil
  x.report('build:') do
    model = ClinVar::RDF::Model::VariationArchiveType.build(record)
  end

  x.report('buffer:') do
    ClinVar::RDF::Turtle::Writer.new(io) do |writer|
      writer << model
    end
  end

end

puts io.string
