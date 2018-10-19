require 'rdf'

# Namespace for ClinVar
module ClinVar

  # Namespace for ClinVar::RDF
  module RDF

    # Module for helping model classes
    module ModelHelper

      # Module to define class method for ClinVar::RDF::ModelHelper
      module ClassMethods
        def build(*args)
          new
        end
      end

      def self.included(klass)
        klass.extend ClassMethods
      end

      def to_rdf
        ::RDF::Graph.new
      end
    end
  end
end
