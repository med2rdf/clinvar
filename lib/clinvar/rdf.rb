require 'clinvar/rdf/version'

# Namespace for ClinVar
module ClinVar

  # Namespace for ClinVar::RDF
  module RDF
    autoload :Model, 'clinvar/rdf/model'
    autoload :ModelHelper, 'clinvar/rdf/model_helper'
    autoload :Vocab, 'clinvar/rdf/vocab'
  end

  # Namespace for ClinVar::XML
  module XML
    autoload :XSD, 'clinvar/xml/xsd'
  end

end
