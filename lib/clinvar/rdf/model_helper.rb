require 'active_support'
require 'active_support/core_ext/string'
require 'rdf'
require 'soap/baseData'
require 'xsd/codegen/gensupport'

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
            arg = if args.first.is_a?(Hash) && args.first.key?('content')
                    args.first['content']
                  elsif args.first.is_a? String
                    args.first
                  else
                    raise "#{obj.class} #{args.first}"
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
                  obj << obj.class.element_type.build(x)
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
            raise("Failed to find setter for #{k}")
          end
        end

        self
      end

      def subject(uri = nil)
        @__subject__ = if uri.is_a?(::RDF::Node)
                         uri
                       else
                         ::RDF::URI.new(uri)
                       end
        self
      end

      def to_rdf
        subject = @__subject__ || ::RDF::Node.new

        ::RDF::Graph.new do |g|
          g << [subject, ::RDF.type, ClinVar::RDF::Vocab[self.class.to_s.demodulize]]

          process_attributes(g, subject)
          process_elements(g, subject)
        end
      end

      def process_attributes(graph, subject)
        dup.attribute_mapping&.each do |key, klass|
          next unless (v = send("#{XMLATTR_PREFIX}#{safemethodname(key)}")).present?
          next unless (v = v.cast(klass)).present?

          graph << [subject, ClinVar::RDF::Vocab[key.to_s.underscore], v]
        end
      end
    end
  end
end

class Object
  def cast(klass)
    if klass.ancestors.include?(XSD::XSDDate)
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

class Symbol
  def underscore
    to_s.underscore
  end

  def scan(*args)
    to_s.scan(*args)
  end
end

module XSD
  module CodeGen
    module GenSupport
      def safemethodname(name)
        name     = name.underscore
        postfix  = name[/[=?!]$/]
        safename = name.scan(/[a-zA-Z0-9_]+/).join('_')
        safename = uncapitalize(safename)
        safename += postfix if postfix
        if /\A[a-z]/ !~ safename or keyword?(safename)
          "m_#{safename}"
        else
          safename
        end
      end

      def safevarname(name)
        name     = name.underscore
        safename = uncapitalize(name.scan(/[a-zA-Z0-9_]+/).join('_'))
        if /\A[a-z]/ !~ safename or keyword?(safename)
          "v_#{safename}"
        else
          safename
        end
      end
    end
  end
end
