module ClinVar
  module RDF
    module ModelHelper
      module ClassMethods
        def build(*args)
          new
        end
      end

      def self.included(klass)
        klass.extend ClassMethods
      end

      def to_rdf

      end
    end
  end
end
