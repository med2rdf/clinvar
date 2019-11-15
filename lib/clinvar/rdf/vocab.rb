require 'rdf'

module ClinVar
  module RDF

    CLINVAR_ID_BASE   = 'http://ncbi.nlm.nih.gov/clinvar/variation/'.freeze
    RCV_ID_BASE       = 'http://identifiers.org/clinvar.record:'.freeze
    SCV_ID_BASE       = 'http://identifiers.org/clinvar.submission:'.freeze
    HGNC_ID_BASE      = 'http://www.genenames.org/data/gene-symbol-report/#!/hgnc_id/HGNC:'.freeze
    NCBI_GENE_ID_BASE = 'http://ncbi.nlm.nih.gov/gene/'.freeze
    REFSEQ_ID_BASE    = 'http://identifiers.org/refseq/'.freeze
    NCBI_BASE         = 'http://ncbi.nlm.nih.gov/'.freeze
    OMIM_BASE         = 'http://omim.org/entry/'.freeze
    UNIPROT_BASE      = 'http://uniprot.org/uniprot/'.freeze
    OBO_BASE          = 'http://purl.obolibrary.org/obo/'.freeze
    ORPHA_BASE        = 'http://www.orpha.net/consor/cgi-bin/OC_Exp.php?Expert='.freeze
    GHR_BASE          = 'http://ghr.nlm.nih.gov/'.freeze
    GARD_BASE         = 'http://rarediseases.info.nih.gov/diseases/'.freeze
    TSC_BASE          = 'http://chromium.lovd.nl/LOVD2/TSC/'.freeze

    FALDO = ::RDF::Vocabulary.new('http://biohackathon.org/resource/faldo#')
    HCO   = ::RDF::Vocabulary.new('http://identifiers.org/hco/')
    M2R   = ::RDF::Vocabulary.new('http://med2rdf.org/ontology/med2rdf#')
    PRISM = ::RDF::Vocabulary.new('http://prismstandard.org/namespaces/1.2/basic/')
    SO    = ::RDF::Vocabulary.new('http://www.sequenceontology.org/browser/current_svn/term/')
    SIO   = ::RDF::Vocabulary.new('http://semanticscience.org/resource/')

    class Vocab < ::RDF::Vocabulary('http://purl.jp/bio/10/clinvar/')
    end
  end
end
