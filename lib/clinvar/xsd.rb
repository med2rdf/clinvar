module ClinVar
  class XSD
    class << self
      def open(path)
        xsd = new

        return xsd unless block_given?

        yield xsd
      end
    end
  end
end

