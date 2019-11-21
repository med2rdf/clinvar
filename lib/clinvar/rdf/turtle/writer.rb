require 'rdf'
require 'rdf/turtle'
require 'rdf/raptor'

require 'clinvar/rdf/refiner'

module ClinVar
  module RDF
    module Turtle

      class Writer

        PREFIXES = {
          clinvar:   CLINVAR_ID_BASE,
          cvo:       Vocab.to_uri,
          dc:        ::RDF::Vocab::DC.to_uri,
          prism:     PRISM.to_uri,
          so:        SO.to_uri,
          faldo:     FALDO.to_uri,
          hco:       HCO.to_uri,
          m2r:       M2R.to_uri,
          rdfs:      ::RDF::Vocab::RDFS.to_uri,
          xsd:       ::RDF::XSD.to_uri,
          hbnc:      HGNC_ID_BASE,
          ncbi_gene: NCBI_GENE_ID_BASE,
          refseq:    REFSEQ_ID_BASE,
          clinvar:   CLINVAR_ID_BASE,
          rcv:       RCV_ID_BASE,
          scv:       SCV_ID_BASE,
          uniprot:   UNIPROT_BASE,
          omim:      OMIM_BASE,
          bibo:      ::RDF::Vocab::BIBO.to_uri,
          obo:       OBO_BASE,
          orpha:     ORPHA_BASE,
          ghr:       GHR_BASE,
          gard:      GARD_BASE,
          tsc:       TSC_BASE,
          doi:       DOI_BASE,
          mesh:      MESH_BASE
        }

        class << self
          def open(path, compress: true)
            f = if compress
                  Zlib::GzipWriter.open(path)
                else
                  File.open(path, 'w')
                end

            writer = new(f)

            return writer unless block_given?

            begin
              yield writer
            ensure
              if f && !f.closed?
                f.close
              end
            end
          end
        end

        def initialize(io = STDOUT)
          @io = io

          yield self if block_given?
        end

        OPTIONS = { prefixes: PREFIXES }

        # @param  [RDF::Enumerable, RDF::Statement, #to_rdf] data
        # @return [Integer] the number of bytes written
        def <<(data)
          buffer = ::RDF::Writer.for(:turtle).buffer(OPTIONS) do |writer|
            writer << data
          end

          buffer.gsub!(/^@.*\n/, '')

          unless @header_written
            ::RDF::Turtle::Writer.new(@io, OPTIONS.merge(stream: true)).write_epilogue
            @header_written = true
          end

          @io.write buffer
        end
      end

    end
  end
end