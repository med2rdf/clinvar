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

      # Module for prepending to WSDL::SOAP::ClassDefCreator
      #
      # @author Daisuke Satoh
      module ClassDefCreatorImprove
        def create_complextypedef(mpath, qname, type, qualified = false)
          c = super
          unless c.nil?
            c.include_module('ModelHelper')
          end
        end
      end
    end
  end
end

module WSDL
  module SOAP
    class ClassDefCreator
      prepend ClinVar::XML::XSD::ClassDefCreatorImprove
    end
  end
end

module XSD
  module CodeGen
    class ClassDef
      def attributes
        @attrdef.collect { |x| x[0] }.compact
      end

      def append_type_info(obj)
        @comment = (@comment || '') + "\nType: #{obj.class.to_s.demodulize}\n"
        self
      end

      def include_module(module_name)
        def_code("include #{module_name}")
        self
      end
    end
  end
end
