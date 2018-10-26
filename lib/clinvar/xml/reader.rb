require 'active_model'
require 'active_support'
require 'active_support/core_ext/hash'
require 'xmlsimple'

module ClinVar
  module XML
    class Reader

      class ParseError < StandardError
      end

      class << self
        def parse(str)
          ClinVar::RDF::Model::VariationArchiveType.build(XmlSimple.xml_in(str))
        end
      end

      def initialize(io = STDIN)
        @io     = io
        @lineno = 0
      end

      def each
        if block_given?
          while (record = shift)
            # begin
              yield self.class.parse(record)
            # rescue StandardError => e
            #   raise ParseError, "#{e.message} at line #{@lineno}, #{record}"
            # end
          end
        else
          to_enum
        end
      end

      private

      START_TAG = /\s*<VariationArchive(\s+.*)?>/
      END_TAG   = %r{\s*</VariationArchive>}

      def shift
        lines = ''

        loop do
          @lineno += 1
          unless (line = @io.gets&.chomp)
            return nil
          end
          next if lines.empty? && !line.match?(START_TAG)

          lines << line

          break lines if line.match?(END_TAG)
        end
      end
    end
  end
end
