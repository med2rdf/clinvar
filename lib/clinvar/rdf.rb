require 'clinvar/rdf/version'

# Namespace for ClinVar
module ClinVar

  # Namespace for ClinVar::RDF
  module RDF
    autoload :ModelHelper, 'clinvar/rdf/model_helper'
    autoload :Vocab, 'clinvar/rdf/vocab'
  end

  # Namespace for ClinVar::XML
  module XML
    autoload :XSD, 'clinvar/xml/xsd'
  end

end

# load data model dynamically
root  = File.expand_path('../../../', __FILE__)
files = Dir[File.join(root, '*.xsd')]
raise("File *.xsd does not found in #{root}") if files.empty?

model = ClinVar::XML::XSD.open(files.last) { |xsd| xsd.to_ruby }
eval(model)
