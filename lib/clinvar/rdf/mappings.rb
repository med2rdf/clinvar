require 'active_support'
require 'active_support/concern'
require 'active_support/core_ext/hash'
require 'yaml'

module ClinVar
  module RDF

    require 'clinvar/rdf/vocab'

    module Mappings
      extend ActiveSupport::Concern

      class << self
        def mappings
          @mappings ||= YAML.load_file(File.expand_path('../mappings.yml', __FILE__)).symbolize_keys
        end
      end

      # @param [String] refseq refseq accession (e.g. NC_000001.11)
      # @param [String] assembly needed if the refseq accession is associated with some assemblies [GRCh37|GRCh38]
      # @return [RDF::URI]
      def refseq2hco(refseq, assembly = nil)
        hco = Mappings.mappings[:chromosome][refseq]

        return nil if hco.nil?

        return HCO[hco] unless hco.is_a?(Array)

        raise('assembly should not be nil') unless assembly

        hco = hco.select { |x| x.end_with?(assembly) }

        raise('cannot assign a unique hco') unless hco.length == 1

        HCO[hco.first]
      end

    end
  end
end
