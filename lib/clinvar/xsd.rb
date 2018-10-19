require 'wsdl/xmlSchema/xsd2ruby'

module ClinVar
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
      @xsd = xsd
    end

    def to_ruby
      WSDL::SOAP::ClassDefCreator.new(@xsd, WSDL::SOAP::ClassNameCreator.new, @module_path).dump
    end
  end
end

