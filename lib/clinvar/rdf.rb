require 'clinvar/rdf/version'

# Namespace for ClinVar
module ClinVar

  # Namespace for ClinVar::RDF
  module RDF
    class << self
      def logger
        @logger ||= Logger.new(STDERR)
      end
    end

    require 'clinvar/rdf/vocab'

    # Namespace for ClinVar::RDF::CLI
    module CLI
      autoload :Convert, 'clinvar/rdf/cli/convert'
      autoload :Runner, 'clinvar/rdf/cli/runner'
    end

    # Namespace for ClinVar::RDF::Turtle
    module Turtle
      autoload :Writer, 'clinvar/rdf/turtle/writer'
    end

    files = Dir[File.expand_path('../../../*.xsd', __FILE__)]
    raise("No *.xsd files found") if files.empty?
    SCHEMA_XSD = files.first

    autoload :Model, 'clinvar/rdf/model'
    autoload :ModelHelper, 'clinvar/rdf/model_helper'
  end

  # Namespace for ClinVar::XML
  module XML
    autoload :Reader, 'clinvar/xml/reader'
    autoload :XSD, 'clinvar/xml/xsd'
  end

end
