module ClinVar
  class XSD
    class << self
      def open(path)
        xsd = new

        return xsd unless block_given?

        yield xsd
      end
    end

    def to_ruby
      'class A; end'
    end

  end
end

