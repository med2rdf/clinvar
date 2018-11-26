require 'rdf'

module ClinVar
  module RDF

    RCV_ID_BASE       = 'http://identifiers.org/clinvar.record:'.freeze
    SCV_ID_BASE       = 'http://identifiers.org/clinvar.submission:'.freeze
    VCV_ID_BASE       = 'http://identifiers.org/clinvar:'.freeze
    HGNC_ID_BASE      = 'http://identifiers.org/hgnc/'.freeze
    NCBI_GENE_ID_BASE = 'http://identifiers.org/ncbigene/'.freeze
    REFSEQ_ID_BASE    = 'http://identifiers.org/refseq/'.freeze

    FALDO = ::RDF::Vocabulary.new('http://biohackathon.org/resource/faldo#')
    HCO   = ::RDF::Vocabulary.new('http://identifiers.org/hco/')
    M2R   = ::RDF::Vocabulary.new('http://med2rdf.org/ontology/med2rdf#')

    class Vocab < ::RDF::Vocabulary('http://purl.jp/bio/10/clinvar/')
    end
  end
end
