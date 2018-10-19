require 'clinvar/rdf/version'

module ClinVar
  module RDF
    autoload :Model, 'clinvar/rdf/model'
    autoload :ModelHelper, 'clinvar/rdf/model_helper'
  end

  module XML
    autoload :XSD, 'clinvar/xml/xsd'
  end
end
