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
            op.banner = "Usage: #{op.program_name} #{self.class.name.demodulize.underscore} [options]"

            op.separator('')
            op.separator('Options:')


            op.on('-h', '--help', 'show help') do
              @options[:help] = true
            end

            op.separator('')
            op.separator("#{op.program_name} #{ClinVar::RDF::VERSION}")
          end
        end
      end
    end
  end
end
