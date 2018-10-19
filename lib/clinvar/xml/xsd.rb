require 'wsdl/xmlSchema/xsd2ruby'

module ClinVar
  module XML
    class XSD
      class << self
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

      def to_ruby
        WSDL::SOAP::ClassDefCreator.new(@xsd, WSDL::SOAP::ClassNameCreator.new, @module_path).dump
      end
    end
  end
end

module ClassDefCreatorImprove
  def create_complextypedef(mpath, qname, type, qualified = false)
    c = super
    unless c.nil?
      c.include_module('ModelHelper')
    end
  end
end

module WSDL
  module SOAP
    class ClassDefCreator
      prepend ClassDefCreatorImprove
    end
  end
end

module XSD
  module CodeGen
    class ClassDef
      def include_module(module_name)
        def_code("include #{module_name}")
        self
      end
    end
  end
end
