require 'optparse'

module ClinVar
  module RDF
    module CLI
      class Convert

        DEFAULT_OPTIONS = { help: false }.freeze

        def initialize
          @options = Hash[DEFAULT_OPTIONS]
        end

        def run
          option_parser.parse!

          if @options[:help]
            STDERR.puts option_parser.help
            exit 0
          end

          Turtle::Writer.new do |writer|
            XML::Reader.new.each { |data| writer << data }
          end
        rescue OptionParser::ParseError => e
          STDERR.puts e.message
          STDERR.puts
          STDERR.puts option_parser.help
          exit 1
        rescue StandardError => e
          STDERR.puts e.message
          STDERR.puts e.backtrace
          exit 99
        end

        private

        def option_parser
          OptionParser.new do |op|
            op.banner = "Usage: #{ClinVar::RDF::CLI::PROG_NAME} #{self.class.name.demodulize.underscore}\n"
            op.banner += "Convert ClinVar data to RDF\n"

            op.separator("\nOptions:")
            op.on('-h', '--help', 'show help') do
              @options[:help] = true
            end

            op.separator('')
          end
        end
      end
    end
  end
end