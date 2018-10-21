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


      def subject(uri = nil)
        @__subject__ = if uri.is_a?(::RDF::Node)
                         uri
                       else
                         ::RDF::URI.new(uri)
                       end
        self
      end

      def to_rdf
        subject = @__subject__ || ::RDF::Node.new

        ::RDF::Graph.new do |g|
          g << [subject, ::RDF.type, ClinVar::RDF::Vocab[self.class.to_s.demodulize]]

          process_attributes(g, subject)
          process_elements(g, subject)
        end
      end
    end
  end
end
