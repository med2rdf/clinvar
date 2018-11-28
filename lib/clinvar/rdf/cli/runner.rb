require 'active_support'
require 'active_support/core_ext/object/inclusion'
require 'active_support/core_ext/string/strip'
require 'active_support/inflector'

module ClinVar
  module RDF
    module CLI

      class Runner
        def run
          command = ARGV.shift || '--help'

          case command
          when '-v', '--version'
            STDERR.puts ClinVar::RDF::VERSION
          when '-h', '--help'
            STDERR.puts help
          when *commands
            target = ClinVar::RDF::CLI.const_get(command.capitalize).new
            target.run if target.respond_to?(:run)
          else
            STDERR.puts "Unknown command: '#{command}'"
            STDERR.puts
            STDERR.puts help
            exit 1
          end

          exit 0
        end

        private

        def commands
          klasses = ClinVar::RDF::CLI.constants.reject do |c|
            c.in? %i[Runner PROG_NAME]
          end
          klasses.map { |k| k.to_s.underscore }
        end

        def help
          <<-USAGE.strip_heredoc % commands.map { |c| "    #{c}" }.join("\n")
          Usage: #{File.basename($0, '.*')} [command]
  
          Commands:
          %s
  
          Options:
              -h, --help                       show help
              -v, --version                    print version
  
          Run '#{File.basename($0, '.*')} COMMAND --help' for more information on a command
          USAGE
        end
      end
    end
  end
end