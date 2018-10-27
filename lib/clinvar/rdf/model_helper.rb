require 'active_support'
require 'active_support/core_ext/string'
require 'clinvar/xml/patch'
require 'rdf'
require 'soap/baseData'

# Namespace for ClinVar
module ClinVar

  # Namespace for ClinVar::RDF
  module RDF

    # Module for helping model classes
    module ModelHelper
      include XSD::CodeGen::GenSupport

      public :safevarname, :safeconstname

      XMLATTR_PREFIX = 'xmlattr_'.freeze

      # Module to define class method for ClinVar::RDF::ModelHelper
      module ClassMethods
        def build(*args)
          obj = new

          if obj.is_a? String
            arg = if args.first.is_a?(Hash)
                    if args.first.key?('content')
                      args.first['content']
                    else
                      ''
                    end
                  elsif args.first.is_a? String
                    args.first
                  end
            obj = new(arg)
            if args.first.is_a?(Hash)
              obj.set_attributes(args.first.reject { |k, _| k == 'content' })
            end
          elsif obj.is_a? Array
            arg = args.first

            arg.each do |hash|
              raise unless hash.is_a? Hash
              hash.each do |_, v|
                raise unless v.is_a? Array
                v.each do |x|
                  type = obj.class.element_type
                  if type.respond_to?(:build)
                    obj << type.build(x)
                  else
                    obj << x
                  end
                end
              end
            end
          else
            raise if args.size > 1
            obj.set_attributes(args.first)
          end

          obj
        end
      end

      def self.included(klass)
        klass.extend ClassMethods
      end

      def set_attributes(hash)
        hash.each do |k, v|
          varname = safevarname(k).to_sym
          if self.class.const_defined? "Attr#{safeconstname(k)}"
            send("#{XMLATTR_PREFIX}#{safemethodname(k)}=", v)
          elsif respond_to?("#{varname}=")
            send("#{varname}=", v)
          else
            ClinVar::RDF.logger&.warn("#{k} does not found in #{self.class}: #{hash}")
          end
        end

        self
      end

      def subject(uri = nil)
        return @__subject__ if uri.nil?

        @__subject__ = if uri.is_a?(::RDF::URI) || uri.is_a?(::RDF::Node)
                         uri
                       else
                         ::RDF::URI.new(uri)
                       end
        self
      end

      def to_rdf
        s = subject || subject(::RDF::Node.new).subject

        ::RDF::Graph.new do |g|
          g << [subject, ::RDF.type, ClinVar::RDF::Vocab[self.class.to_s.demodulize]]

          process_attributes(g, s)
          process_elements(g, s)
          process_content(g, s)
        end
      end

      def process_attributes(graph, subject)
        dup.attribute_mapping&.each do |key, klass|
          next unless (v = send("#{XMLATTR_PREFIX}#{safemethodname(key)}")).present?
          next unless (v = v.cast(klass)).present?

          graph << [subject, ClinVar::RDF::Vocab[key.to_s.underscore], v]
        end
      end

      def process_elements(graph, subject)
        element_mapping&.each do |key, klass|
          next unless (v = send(key)).present?

          if klass.ancestors.include?(XSD::XSDAnySimpleType)
            process_simple_type(v, graph, subject, key, klass)
          elsif klass.ancestors.include?(::String)
            process_string(v, graph, subject, key, klass)
          elsif klass.ancestors.include?(::Array)
            process_array(v, graph, subject, key, klass)
          else
            process_object(v, graph, subject, key, klass)
          end
        end
      end

      def process_content(graph, subject)
        return unless is_a? String

        if self.present?
          graph << [subject, ClinVar::RDF::Vocab[self.class.name.demodulize.underscore], self]
        end
      end

      def process_simple_type(value, graph, subject, element_name, klass)
        Array(value).each do |x|
          next unless (y = x.cast(klass)).present?

          graph << [subject, ClinVar::RDF::Vocab[element_name.to_s.underscore], y]
        end
      end

      def process_string(value, graph, subject, element_name, klass)
        if value.is_a? Array
          value.each do |x|
            if x.is_a? Hash
              s = ::RDF::Node.new
              graph << [subject, ClinVar::RDF::Vocab[element_name.to_s.underscore], s]
              graph << klass.build(x).subject(s)
            elsif x.is_a?(String) && (str = x.match(/^"?(.*)"?$/))
              graph << [subject, ClinVar::RDF::Vocab["#{element_name.to_s.underscore}"], str[1]]
            else
              raise "#{x.class} #{x}"
            end
          end
        else
          raise
        end
      end

      def process_array(value, graph, subject, element_name, klass)
        klass.build(value).each do |x|
          s = ::RDF::Node.new
          if x.respond_to?(:subject)
            graph << [subject, ClinVar::RDF::Vocab[value.first.keys.first.underscore], s]
            graph << x.subject(s)
          else
            graph << [subject, ClinVar::RDF::Vocab[value.first.keys.first.underscore], x]
          end

        end
      end

      def process_object(value, graph, subject, element_name, klass)
        if value.is_a? Array
          value.each do |x|
            s = ::RDF::Node.new
            graph << [subject, ClinVar::RDF::Vocab[element_name.to_s.underscore], s]
            graph << klass.build(x).subject(s)
          end
        else
          raise
        end
      end
    end
  end
end

class Object
  def cast(klass)
    if klass.ancestors.include?(XSD::XSDString)
      ::RDF::Literal.new(self)
    elsif klass.ancestors.include?(XSD::XSDDate)
      ::RDF::Literal::Date.new(self)
    elsif klass.ancestors.include?(XSD::XSDInteger)
      ::RDF::Literal::Integer.new(self)
    else
      klass.new(self)
    end
  rescue
    nil
  end
end
