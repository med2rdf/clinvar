require 'xsd/codegen/gensupport'

module ClinVar
  module XML
    class XSD
      # Module for prepending to WSDL::SOAP::ClassDefCreator
      module ClassDefCreatorImprove
        def dump(type = nil)
          result = "require 'xsd/qname'\n"

          modules = modulepath_split(@modulepath)

          modules.each.with_index do |m, i|
            result << "module #{m}\n".indent(i * 2)
          end

          str = dump_group(type).indent(modules.length * 2)
          unless str.empty?
            result << "\n" unless result.empty?
            result << str.indent(modules.length * 2)
          end
          str = dump_complextype(type)
          unless str.empty?
            result << "\n" unless result.empty?
            result << str.indent(modules.length * 2)
          end
          str = dump_simpletype(type)
          unless str.empty?
            result << "\n" unless result.empty?
            result << str.indent(modules.length * 2)
          end
          str = dump_element(type)
          unless str.empty?
            result << "\n" unless result.empty?
            result << str.indent(modules.length * 2)
          end
          str = dump_attribute(type)
          unless str.empty?
            result << "\n" unless result.empty?
            result << str.indent(modules.length * 2)
          end

          modules.length.times.reverse_each do |i|
            result << "end\n".indent(i * 2)
          end

          result.gsub!(/def initialize$/, 'def initialize(*args)')

          result
        end

        def create_complextypedef(mpath, qname, type, qualified = false)
          c = super
          unless c.nil?
            c.include_module('ModelHelper')
          end
        end

        def create_simpletypedef(mpath, qname, simpletype, qualified = false)
          c = super
          unless c.nil?
            c.append_type_info(simpletype)
          end
        end

        def create_simpleclassdef(mpath, qname, type_or_element)
          c = super
          define_attr_mapping(c, mpath, qname, type_or_element)
          define_element_mapping(c, mpath, qname, type_or_element)
        end

        def create_structdef(mpath, qname, typedef, qualified = false)
          c = super
          define_attr_mapping(c, mpath, qname, typedef)
          define_element_mapping(c, mpath, qname, typedef)
        end

        def create_arraydef(mpath, qname, typedef)
          c = super

          parentmodule = mapped_class_name(qname, mpath)
          type         = collect_attribute_type(typedef.elements, parentmodule).first

          c.def_method('self.element_type') { type[1] }

          c
        end

        def define_attr_mapping(class_def, mpath, qname, type_or_element)
          class_def.def_method('attribute_mapping') do
            code = []
            code << '@__attribute_mapping__ ||= {'
            code << type_or_element.attributes.map do |attribute|
              "#{name_attribute(attribute).name}: #{attribute_basetype(attribute) || String}".indent(2)
            end.join(",\n")
            code << '}'
          end
          class_def
        end

        def define_element_mapping(class_def, mpath, qname, type_or_element)
          parentmodule = mapped_class_name(qname, mpath)
          class_def.def_method('element_mapping') do
            code = []
            code << '@__element_mapping__ ||= {'
            code << collect_attribute_type(type_or_element.elements, parentmodule).map do |name, type|
              "#{safevarname(name)}: #{type}".indent(2)
            end.join(",\n")
            code << '}'
          end
          class_def
        end

        def collect_attribute_type(elements, mpath)
          result = []
          elements.each do |element|
            case element
              # when XMLSchema::Any
            when WSDL::XMLSchema::Element
              next if element.ref == WSDL::XMLSchema::SchemaName
              name     = name_element(element).name
              typebase = (element.anonymous_type? ? mpath : @modulepath)
              attrname = safemethodname(name)
              result << [attrname, create_type_name(typebase, element) || '(any)']
            when WSDL::XMLSchema::Sequence,
              WSDL::XMLSchema::Choice,
              WSDL::XMLSchema::Group
              result.push(*collect_attribute_type(element.elements, mpath))
            else
              raise RuntimeError.new("unknown type: #{element}")
            end
          end
          result
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
