require 'active_support'
require 'active_support/core_ext/string'
require 'wsdl/xmlSchema/xsd2ruby'

# Namespace for ClinVar
module ClinVar
  # Namespace for ClinVar::XML
  module XML
    # Class for handling ClinVar XSD
    #
    # @author Daisuke Satoh
    # @attr [Array<String>] module_path accessor for module_path
    class XSD
      require 'clinvar/xml/patch'

      class << self
        # @param [String] path path to xsd
        # @return [ClinVar::XML::XSD, Object] an instance of ClinVar::XML::XSD or last evaluated value if block given
        # @yield [xsd] yield instance of ClinVar::XML::XSD
        # @yieldparam [ClinVar::XML::XSD] xsd the instance of the xsd
        # @yieldreturn [Object] last evaluated expression in the block
        def open(path)
          xsd = new(WSDL::XMLSchema::Importer.import(path))

          return xsd unless block_given?

          yield xsd
        end
      end

      attr_accessor :module_path

      def initialize(xsd, **options)
        @module_path = options.delete(:module_path) || %w[ClinVar RDF Model]
        @xsd         = xsd
      end

      # Convert XSD definitions into ruby classes
      # @return [String] class definitions
      def to_ruby
        WSDL::SOAP::ClassDefCreator.new(@xsd, WSDL::SOAP::ClassNameCreator.new, @module_path).dump
      end
    end
  end
end
