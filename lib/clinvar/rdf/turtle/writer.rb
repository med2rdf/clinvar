require 'rdf'
require 'rdf/turtle'
require 'rdf/raptor'

require 'clinvar/rdf/refiner'

module ClinVar
  module RDF
    module Turtle

      class Writer

        BASE_URI = VCV_ID_BASE
        PREFIXES = {
          cvo:       Vocab.to_uri,
          dc:        ::RDF::Vocab::DC.to_uri,
          faldo:     FALDO.to_uri,
          hco:       HCO.to_uri,
          m2r:       M2R.to_uri,
          rdfs:      ::RDF::Vocab::RDFS.to_uri,
          xsd:       ::RDF::XSD.to_uri,
          rcv:       RCV_ID_BASE,
          scv:       SCV_ID_BASE,
          vcv:       VCV_ID_BASE,
          hbnc:      HGNC_ID_BASE,
          ncbi_gene: NCBI_GENE_ID_BASE,
          refseq:    REFSEQ_ID_BASE
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

        OPTIONS = { base_uri: BASE_URI,
                    prefixes: PREFIXES }

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