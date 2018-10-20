require 'xsd/qname'
module ClinVar
  module RDF
    module Model

      # {}typeComment
      #   xmlattr_data_source - SOAP::SOAPString
      #   xmlattr_type - SOAP::SOAPString
      class TypeComment < ::String
        AttrDataSource = XSD::QName.new(nil, "DataSource")
        AttrType = XSD::QName.new(nil, "Type")

        include ModelHelper

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_data_source
          __xmlattr[AttrDataSource]
        end

        def xmlattr_data_source=(value)
          __xmlattr[AttrDataSource] = value
        end

        def xmlattr_type
          __xmlattr[AttrType]
        end

        def xmlattr_type=(value)
          __xmlattr[AttrType] = value
        end

        def initialize(*arg)
          super
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            DataSource: SOAP::SOAPString,
            Type: SOAP::SOAPString
          }
        end

        def element_mapping
          @__element_mapping__ ||= {

          }
        end
      end

      # {}typeHGVSExpression
      #   nucleotide_expression - ClinVar::RDF::Model::TypeNucleotideSequenceExpression
      #   protein_expression - ClinVar::RDF::Model::TypeProteinSequenceExpression
      #   molecular_consequence - ClinVar::RDF::Model::TypeXref
      #   xmlattr_type - SOAP::SOAPString
      #   xmlattr_assembly - (any)
      class TypeHGVSExpression
        AttrAssembly = XSD::QName.new(nil, "Assembly")
        AttrType = XSD::QName.new(nil, "Type")

        include ModelHelper

        attr_accessor :nucleotide_expression
        attr_accessor :protein_expression
        attr_accessor :molecular_consequence

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_type
          __xmlattr[AttrType]
        end

        def xmlattr_type=(value)
          __xmlattr[AttrType] = value
        end

        def xmlattr_assembly
          __xmlattr[AttrAssembly]
        end

        def xmlattr_assembly=(value)
          __xmlattr[AttrAssembly] = value
        end

        def initialize(nucleotide_expression = nil, protein_expression = nil, molecular_consequence = nil)
          @nucleotide_expression = nucleotide_expression
          @protein_expression = protein_expression
          @molecular_consequence = molecular_consequence
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            Type: SOAP::SOAPString,
            Assembly: String
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            nucleotide_expression: ClinVar::RDF::Model::TypeNucleotideSequenceExpression,
            protein_expression: ClinVar::RDF::Model::TypeProteinSequenceExpression,
            molecular_consequence: ClinVar::RDF::Model::TypeXref
          }
        end
      end

      # {}typeHaplotype
      #   simple_allele - ClinVar::RDF::Model::TypeAllele
      #   name - SOAP::SOAPString
      #   variation_type - ClinVar::RDF::Model::TypeHaplotypeVariationType
      #   other_name_list - ClinVar::RDF::Model::TypeNames
      #   hgv_slist - ClinVar::RDF::Model::TypeHaplotype::HGVSlist
      #   interpretations - ClinVar::RDF::Model::TypeAggregatedInterpretationSet
      #   functional_consequence - ClinVar::RDF::Model::TypeFunctionalConsequence
      #   x_ref_list - ClinVar::RDF::Model::TypeHaplotype::XRefList
      #   comment - ClinVar::RDF::Model::TypeComment
      #   xmlattr_variation_id - SOAP::SOAPInt
      #   xmlattr_number_of_copies - SOAP::SOAPInt
      class TypeHaplotype
        AttrNumberOfCopies = XSD::QName.new(nil, "NumberOfCopies")
        AttrVariationID = XSD::QName.new(nil, "VariationID")

        # inner class for member: HGVSlist
        # {}HGVSlist
        class HGVSlist < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeHGVSExpression
          end
        end

        # inner class for member: XRefList
        # {}XRefList
        class XRefList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeXref
          end
        end

        include ModelHelper

        attr_accessor :simple_allele
        attr_accessor :name
        attr_accessor :variation_type
        attr_accessor :other_name_list
        attr_accessor :hgv_slist
        attr_accessor :interpretations
        attr_accessor :functional_consequence
        attr_accessor :x_ref_list
        attr_accessor :comment

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_variation_id
          __xmlattr[AttrVariationID]
        end

        def xmlattr_variation_id=(value)
          __xmlattr[AttrVariationID] = value
        end

        def xmlattr_number_of_copies
          __xmlattr[AttrNumberOfCopies]
        end

        def xmlattr_number_of_copies=(value)
          __xmlattr[AttrNumberOfCopies] = value
        end

        def initialize(simple_allele = [], name = nil, variation_type = nil, other_name_list = nil, hgv_slist = nil, interpretations = nil, functional_consequence = [], x_ref_list = nil, comment = [])
          @simple_allele = simple_allele
          @name = name
          @variation_type = variation_type
          @other_name_list = other_name_list
          @hgv_slist = hgv_slist
          @interpretations = interpretations
          @functional_consequence = functional_consequence
          @x_ref_list = x_ref_list
          @comment = comment
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            VariationID: SOAP::SOAPInt,
            NumberOfCopies: SOAP::SOAPInt
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            simple_allele: ClinVar::RDF::Model::TypeAllele,
            name: SOAP::SOAPString,
            variation_type: ClinVar::RDF::Model::TypeHaplotypeVariationType,
            other_name_list: ClinVar::RDF::Model::TypeNames,
            hgv_slist: ClinVar::RDF::Model::TypeHaplotype::HGVSlist,
            interpretations: ClinVar::RDF::Model::TypeAggregatedInterpretationSet,
            functional_consequence: ClinVar::RDF::Model::TypeFunctionalConsequence,
            x_ref_list: ClinVar::RDF::Model::TypeHaplotype::XRefList,
            comment: ClinVar::RDF::Model::TypeComment
          }
        end
      end

      # {}typeHaplotypeSCV
      #   simple_allele - ClinVar::RDF::Model::TypeAlleleSCV
      #   name - SOAP::SOAPString
      #   other_name_list - ClinVar::RDF::Model::TypeNames
      #   interpretations - ClinVar::RDF::Model::TypeAggregatedInterpretationSet
      #   functional_consequence - ClinVar::RDF::Model::TypeFunctionalConsequence
      #   x_ref_list - ClinVar::RDF::Model::TypeHaplotypeSCV::XRefList
      #   citation_list - ClinVar::RDF::Model::TypeHaplotypeSCV::CitationList
      #   comment - ClinVar::RDF::Model::TypeComment
      #   attribute_set - ClinVar::RDF::Model::TypeAttributeSet
      #   xmlattr_variation_id - SOAP::SOAPInt
      #   xmlattr_number_of_copies - SOAP::SOAPInt
      class TypeHaplotypeSCV
        AttrNumberOfCopies = XSD::QName.new(nil, "NumberOfCopies")
        AttrVariationID = XSD::QName.new(nil, "VariationID")

        # inner class for member: XRefList
        # {}XRefList
        class XRefList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeXref
          end
        end

        # inner class for member: CitationList
        # {}CitationList
        class CitationList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeCitation
          end
        end

        include ModelHelper

        attr_accessor :simple_allele
        attr_accessor :name
        attr_accessor :other_name_list
        attr_accessor :interpretations
        attr_accessor :functional_consequence
        attr_accessor :x_ref_list
        attr_accessor :citation_list
        attr_accessor :comment
        attr_accessor :attribute_set

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_variation_id
          __xmlattr[AttrVariationID]
        end

        def xmlattr_variation_id=(value)
          __xmlattr[AttrVariationID] = value
        end

        def xmlattr_number_of_copies
          __xmlattr[AttrNumberOfCopies]
        end

        def xmlattr_number_of_copies=(value)
          __xmlattr[AttrNumberOfCopies] = value
        end

        def initialize(simple_allele = [], name = nil, other_name_list = nil, interpretations = nil, functional_consequence = [], x_ref_list = nil, citation_list = nil, comment = [], attribute_set = [])
          @simple_allele = simple_allele
          @name = name
          @other_name_list = other_name_list
          @interpretations = interpretations
          @functional_consequence = functional_consequence
          @x_ref_list = x_ref_list
          @citation_list = citation_list
          @comment = comment
          @attribute_set = attribute_set
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            VariationID: SOAP::SOAPInt,
            NumberOfCopies: SOAP::SOAPInt
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            simple_allele: ClinVar::RDF::Model::TypeAlleleSCV,
            name: SOAP::SOAPString,
            other_name_list: ClinVar::RDF::Model::TypeNames,
            interpretations: ClinVar::RDF::Model::TypeAggregatedInterpretationSet,
            functional_consequence: ClinVar::RDF::Model::TypeFunctionalConsequence,
            x_ref_list: ClinVar::RDF::Model::TypeHaplotypeSCV::XRefList,
            citation_list: ClinVar::RDF::Model::TypeHaplotypeSCV::CitationList,
            comment: ClinVar::RDF::Model::TypeComment,
            attribute_set: ClinVar::RDF::Model::TypeAttributeSet
          }
        end
      end

      # {}typeAttribute
      #   xmlattr_integer_value - SOAP::SOAPInt
      #   xmlattr_date_value - SOAP::SOAPDate
      class TypeAttribute < ::String
        AttrDateValue = XSD::QName.new(nil, "dateValue")
        AttrIntegerValue = XSD::QName.new(nil, "integerValue")

        include ModelHelper

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_integer_value
          __xmlattr[AttrIntegerValue]
        end

        def xmlattr_integer_value=(value)
          __xmlattr[AttrIntegerValue] = value
        end

        def xmlattr_date_value
          __xmlattr[AttrDateValue]
        end

        def xmlattr_date_value=(value)
          __xmlattr[AttrDateValue] = value
        end

        def initialize(*arg)
          super
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            integerValue: SOAP::SOAPInt,
            dateValue: SOAP::SOAPDate
          }
        end

        def element_mapping
          @__element_mapping__ ||= {

          }
        end
      end

      # {}typeAlleleDescr
      #   name - SOAP::SOAPString
      #   relative_orientation - SOAP::SOAPString
      #   zygosity - ClinVar::RDF::Model::TypeZygosity
      #   clinical_significance - ClinVar::RDF::Model::ClinicalSignificanceType
      class TypeAlleleDescr
        include ModelHelper

        attr_accessor :name
        attr_accessor :relative_orientation
        attr_accessor :zygosity
        attr_accessor :clinical_significance

        def initialize(name = nil, relative_orientation = nil, zygosity = nil, clinical_significance = nil)
          @name = name
          @relative_orientation = relative_orientation
          @zygosity = zygosity
          @clinical_significance = clinical_significance
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {

          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            name: SOAP::SOAPString,
            relative_orientation: SOAP::SOAPString,
            zygosity: ClinVar::RDF::Model::TypeZygosity,
            clinical_significance: ClinVar::RDF::Model::ClinicalSignificanceType
          }
        end
      end

      # {}typeLocation
      #   cytogenetic_location - SOAP::SOAPString
      #   sequence_location - ClinVar::RDF::Model::TypeLocation::SequenceLocation
      #   gene_location - SOAP::SOAPString
      #   x_ref - ClinVar::RDF::Model::TypeXref
      class TypeLocation

        # inner class for member: SequenceLocation
        # {}SequenceLocation
        #   xmlattr_for_display - SOAP::SOAPBoolean
        #   xmlattr_assembly - SOAP::SOAPString
        #   xmlattr_chr - (any)
        #   xmlattr_accession - SOAP::SOAPString
        #   xmlattr_outer_start - SOAP::SOAPNonNegativeInteger
        #   xmlattr_inner_start - SOAP::SOAPNonNegativeInteger
        #   xmlattr_start - SOAP::SOAPNonNegativeInteger
        #   xmlattr_stop - SOAP::SOAPPositiveInteger
        #   xmlattr_inner_stop - SOAP::SOAPPositiveInteger
        #   xmlattr_outer_stop - SOAP::SOAPPositiveInteger
        #   xmlattr_display_start - SOAP::SOAPNonNegativeInteger
        #   xmlattr_display_stop - SOAP::SOAPPositiveInteger
        #   xmlattr_strand - SOAP::SOAPString
        #   xmlattr_variant_length - SOAP::SOAPPositiveInteger
        #   xmlattr_reference_allele - SOAP::SOAPString
        #   xmlattr_alternate_allele - SOAP::SOAPString
        #   xmlattr_assembly_accession_version - SOAP::SOAPString
        #   xmlattr_assembly_status - SOAP::SOAPString
        #   xmlattr_position_vcf - SOAP::SOAPNonNegativeInteger
        #   xmlattr_reference_allele_vcf - SOAP::SOAPString
        #   xmlattr_alternate_allele_vcf - SOAP::SOAPString
        #   xmlattr_for_display_length - SOAP::SOAPBoolean
        class SequenceLocation
          AttrAccession = XSD::QName.new(nil, "Accession")
          AttrAlternateAllele = XSD::QName.new(nil, "alternateAllele")
          AttrAlternateAlleleVCF = XSD::QName.new(nil, "alternateAlleleVCF")
          AttrAssembly = XSD::QName.new(nil, "Assembly")
          AttrAssemblyAccessionVersion = XSD::QName.new(nil, "AssemblyAccessionVersion")
          AttrAssemblyStatus = XSD::QName.new(nil, "AssemblyStatus")
          AttrChr = XSD::QName.new(nil, "Chr")
          AttrDisplay_start = XSD::QName.new(nil, "display_start")
          AttrDisplay_stop = XSD::QName.new(nil, "display_stop")
          AttrForDisplay = XSD::QName.new(nil, "forDisplay")
          AttrForDisplayLength = XSD::QName.new(nil, "forDisplayLength")
          AttrInnerStart = XSD::QName.new(nil, "innerStart")
          AttrInnerStop = XSD::QName.new(nil, "innerStop")
          AttrOuterStart = XSD::QName.new(nil, "outerStart")
          AttrOuterStop = XSD::QName.new(nil, "outerStop")
          AttrPositionVCF = XSD::QName.new(nil, "positionVCF")
          AttrReferenceAllele = XSD::QName.new(nil, "referenceAllele")
          AttrReferenceAlleleVCF = XSD::QName.new(nil, "referenceAlleleVCF")
          AttrStart = XSD::QName.new(nil, "start")
          AttrStop = XSD::QName.new(nil, "stop")
          AttrStrand = XSD::QName.new(nil, "Strand")
          AttrVariantLength = XSD::QName.new(nil, "variantLength")

          include ModelHelper

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_for_display
            __xmlattr[AttrForDisplay]
          end

          def xmlattr_for_display=(value)
            __xmlattr[AttrForDisplay] = value
          end

          def xmlattr_assembly
            __xmlattr[AttrAssembly]
          end

          def xmlattr_assembly=(value)
            __xmlattr[AttrAssembly] = value
          end

          def xmlattr_chr
            __xmlattr[AttrChr]
          end

          def xmlattr_chr=(value)
            __xmlattr[AttrChr] = value
          end

          def xmlattr_accession
            __xmlattr[AttrAccession]
          end

          def xmlattr_accession=(value)
            __xmlattr[AttrAccession] = value
          end

          def xmlattr_outer_start
            __xmlattr[AttrOuterStart]
          end

          def xmlattr_outer_start=(value)
            __xmlattr[AttrOuterStart] = value
          end

          def xmlattr_inner_start
            __xmlattr[AttrInnerStart]
          end

          def xmlattr_inner_start=(value)
            __xmlattr[AttrInnerStart] = value
          end

          def xmlattr_start
            __xmlattr[AttrStart]
          end

          def xmlattr_start=(value)
            __xmlattr[AttrStart] = value
          end

          def xmlattr_stop
            __xmlattr[AttrStop]
          end

          def xmlattr_stop=(value)
            __xmlattr[AttrStop] = value
          end

          def xmlattr_inner_stop
            __xmlattr[AttrInnerStop]
          end

          def xmlattr_inner_stop=(value)
            __xmlattr[AttrInnerStop] = value
          end

          def xmlattr_outer_stop
            __xmlattr[AttrOuterStop]
          end

          def xmlattr_outer_stop=(value)
            __xmlattr[AttrOuterStop] = value
          end

          def xmlattr_display_start
            __xmlattr[AttrDisplay_start]
          end

          def xmlattr_display_start=(value)
            __xmlattr[AttrDisplay_start] = value
          end

          def xmlattr_display_stop
            __xmlattr[AttrDisplay_stop]
          end

          def xmlattr_display_stop=(value)
            __xmlattr[AttrDisplay_stop] = value
          end

          def xmlattr_strand
            __xmlattr[AttrStrand]
          end

          def xmlattr_strand=(value)
            __xmlattr[AttrStrand] = value
          end

          def xmlattr_variant_length
            __xmlattr[AttrVariantLength]
          end

          def xmlattr_variant_length=(value)
            __xmlattr[AttrVariantLength] = value
          end

          def xmlattr_reference_allele
            __xmlattr[AttrReferenceAllele]
          end

          def xmlattr_reference_allele=(value)
            __xmlattr[AttrReferenceAllele] = value
          end

          def xmlattr_alternate_allele
            __xmlattr[AttrAlternateAllele]
          end

          def xmlattr_alternate_allele=(value)
            __xmlattr[AttrAlternateAllele] = value
          end

          def xmlattr_assembly_accession_version
            __xmlattr[AttrAssemblyAccessionVersion]
          end

          def xmlattr_assembly_accession_version=(value)
            __xmlattr[AttrAssemblyAccessionVersion] = value
          end

          def xmlattr_assembly_status
            __xmlattr[AttrAssemblyStatus]
          end

          def xmlattr_assembly_status=(value)
            __xmlattr[AttrAssemblyStatus] = value
          end

          def xmlattr_position_vcf
            __xmlattr[AttrPositionVCF]
          end

          def xmlattr_position_vcf=(value)
            __xmlattr[AttrPositionVCF] = value
          end

          def xmlattr_reference_allele_vcf
            __xmlattr[AttrReferenceAlleleVCF]
          end

          def xmlattr_reference_allele_vcf=(value)
            __xmlattr[AttrReferenceAlleleVCF] = value
          end

          def xmlattr_alternate_allele_vcf
            __xmlattr[AttrAlternateAlleleVCF]
          end

          def xmlattr_alternate_allele_vcf=(value)
            __xmlattr[AttrAlternateAlleleVCF] = value
          end

          def xmlattr_for_display_length
            __xmlattr[AttrForDisplayLength]
          end

          def xmlattr_for_display_length=(value)
            __xmlattr[AttrForDisplayLength] = value
          end

          def initialize(*args)
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              forDisplay: SOAP::SOAPBoolean,
              Assembly: SOAP::SOAPString,
              Chr: String,
              Accession: SOAP::SOAPString,
              outerStart: SOAP::SOAPNonNegativeInteger,
              innerStart: SOAP::SOAPNonNegativeInteger,
              start: SOAP::SOAPNonNegativeInteger,
              stop: SOAP::SOAPPositiveInteger,
              innerStop: SOAP::SOAPPositiveInteger,
              outerStop: SOAP::SOAPPositiveInteger,
              display_start: SOAP::SOAPNonNegativeInteger,
              display_stop: SOAP::SOAPPositiveInteger,
              Strand: SOAP::SOAPString,
              variantLength: SOAP::SOAPPositiveInteger,
              referenceAllele: SOAP::SOAPString,
              alternateAllele: SOAP::SOAPString,
              AssemblyAccessionVersion: SOAP::SOAPString,
              AssemblyStatus: SOAP::SOAPString,
              positionVCF: SOAP::SOAPNonNegativeInteger,
              referenceAlleleVCF: SOAP::SOAPString,
              alternateAlleleVCF: SOAP::SOAPString,
              forDisplayLength: SOAP::SOAPBoolean
            }
          end

          def element_mapping
            @__element_mapping__ ||= {

            }
          end
        end

        include ModelHelper

        attr_accessor :cytogenetic_location
        attr_accessor :sequence_location
        attr_accessor :gene_location
        attr_accessor :x_ref

        def initialize(cytogenetic_location = [], sequence_location = [], gene_location = [], x_ref = [])
          @cytogenetic_location = cytogenetic_location
          @sequence_location = sequence_location
          @gene_location = gene_location
          @x_ref = x_ref
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {

          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            cytogenetic_location: SOAP::SOAPString,
            sequence_location: ClinVar::RDF::Model::TypeLocation::SequenceLocation,
            gene_location: SOAP::SOAPString,
            x_ref: ClinVar::RDF::Model::TypeXref
          }
        end
      end

      # {}typeAllele
      #   gene_list - ClinVar::RDF::Model::TypeAllele::GeneList
      #   name - SOAP::SOAPString
      #   variant_type - SOAP::SOAPString
      #   location - ClinVar::RDF::Model::TypeLocation
      #   other_name_list - ClinVar::RDF::Model::TypeNames
      #   protein_change - SOAP::SOAPString
      #   hgv_slist - ClinVar::RDF::Model::TypeAllele::HGVSlist
      #   interpretations - ClinVar::RDF::Model::TypeAggregatedInterpretationSet
      #   x_ref_list - ClinVar::RDF::Model::TypeAllele::XRefList
      #   comment - ClinVar::RDF::Model::TypeComment
      #   functional_consequence - ClinVar::RDF::Model::TypeFunctionalConsequence
      #   allele_frequency_list - ClinVar::RDF::Model::TypeAllele::AlleleFrequencyList
      #   global_minor_allele_frequency - ClinVar::RDF::Model::TypeAllele::GlobalMinorAlleleFrequency
      #   suspect_list - ClinVar::RDF::Model::TypeAllele::SuspectList
      #   xmlattr_allele_id - SOAP::SOAPInt
      #   xmlattr_variation_id - SOAP::SOAPPositiveInteger
      class TypeAllele
        AttrAlleleID = XSD::QName.new(nil, "AlleleID")
        AttrVariationID = XSD::QName.new(nil, "VariationID")

        # inner class for member: GeneList
        # {}GeneList
        #   gene - ClinVar::RDF::Model::TypeAllele::GeneList::Gene
        #   xmlattr_gene_count - SOAP::SOAPInt
        class GeneList
          AttrGeneCount = XSD::QName.new(nil, "GeneCount")

          # inner class for member: Gene
          # {}Gene
          #   location - ClinVar::RDF::Model::TypeLocation
          #   omim - SOAP::SOAPPositiveInteger
          #   haploinsufficiency - ClinVar::RDF::Model::TypeAllele::GeneList::Gene::Haploinsufficiency
          #   triplosensitivity - ClinVar::RDF::Model::TypeAllele::GeneList::Gene::Triplosensitivity
          #   property - SOAP::SOAPString
          #   xmlattr_symbol - (any)
          #   xmlattr_full_name - SOAP::SOAPString
          #   xmlattr_gene_id - SOAP::SOAPPositiveInteger
          #   xmlattr_hgnc_id - SOAP::SOAPString
          #   xmlattr_source - SOAP::SOAPString
          #   xmlattr_relationship_type - SOAP::SOAPString
          class Gene
            AttrC_Symbol = XSD::QName.new(nil, "Symbol")
            AttrFullName = XSD::QName.new(nil, "FullName")
            AttrGeneID = XSD::QName.new(nil, "GeneID")
            AttrHGNC_ID = XSD::QName.new(nil, "HGNC_ID")
            AttrRelationshipType = XSD::QName.new(nil, "RelationshipType")
            AttrSource = XSD::QName.new(nil, "Source")

            # inner class for member: Haploinsufficiency
            # {}Haploinsufficiency
            #   xmlattr_last_evaluated - SOAP::SOAPDate
            #   xmlattr_clin_gen - SOAP::SOAPAnyURI
            class Haploinsufficiency < ::String
              AttrClinGen = XSD::QName.new(nil, "ClinGen")
              AttrLast_evaluated = XSD::QName.new(nil, "last_evaluated")

              include ModelHelper

              def __xmlattr
                @__xmlattr ||= {}
              end

              def xmlattr_last_evaluated
                __xmlattr[AttrLast_evaluated]
              end

              def xmlattr_last_evaluated=(value)
                __xmlattr[AttrLast_evaluated] = value
              end

              def xmlattr_clin_gen
                __xmlattr[AttrClinGen]
              end

              def xmlattr_clin_gen=(value)
                __xmlattr[AttrClinGen] = value
              end

              def initialize(*arg)
                super
                @__xmlattr = {}
              end

              def attribute_mapping
                @__attribute_mapping__ ||= {
                  last_evaluated: SOAP::SOAPDate,
                  ClinGen: SOAP::SOAPAnyURI
                }
              end

              def element_mapping
                @__element_mapping__ ||= {

                }
              end
            end

            # inner class for member: Triplosensitivity
            # {}Triplosensitivity
            #   xmlattr_last_evaluated - SOAP::SOAPDate
            #   xmlattr_clin_gen - SOAP::SOAPAnyURI
            class Triplosensitivity < ::String
              AttrClinGen = XSD::QName.new(nil, "ClinGen")
              AttrLast_evaluated = XSD::QName.new(nil, "last_evaluated")

              include ModelHelper

              def __xmlattr
                @__xmlattr ||= {}
              end

              def xmlattr_last_evaluated
                __xmlattr[AttrLast_evaluated]
              end

              def xmlattr_last_evaluated=(value)
                __xmlattr[AttrLast_evaluated] = value
              end

              def xmlattr_clin_gen
                __xmlattr[AttrClinGen]
              end

              def xmlattr_clin_gen=(value)
                __xmlattr[AttrClinGen] = value
              end

              def initialize(*arg)
                super
                @__xmlattr = {}
              end

              def attribute_mapping
                @__attribute_mapping__ ||= {
                  last_evaluated: SOAP::SOAPDate,
                  ClinGen: SOAP::SOAPAnyURI
                }
              end

              def element_mapping
                @__element_mapping__ ||= {

                }
              end
            end

            include ModelHelper

            attr_accessor :location
            attr_accessor :omim
            attr_accessor :haploinsufficiency
            attr_accessor :triplosensitivity
            attr_accessor :property

            def __xmlattr
              @__xmlattr ||= {}
            end

            def xmlattr_symbol
              __xmlattr[AttrC_Symbol]
            end

            def xmlattr_symbol=(value)
              __xmlattr[AttrC_Symbol] = value
            end

            def xmlattr_full_name
              __xmlattr[AttrFullName]
            end

            def xmlattr_full_name=(value)
              __xmlattr[AttrFullName] = value
            end

            def xmlattr_gene_id
              __xmlattr[AttrGeneID]
            end

            def xmlattr_gene_id=(value)
              __xmlattr[AttrGeneID] = value
            end

            def xmlattr_hgnc_id
              __xmlattr[AttrHGNC_ID]
            end

            def xmlattr_hgnc_id=(value)
              __xmlattr[AttrHGNC_ID] = value
            end

            def xmlattr_source
              __xmlattr[AttrSource]
            end

            def xmlattr_source=(value)
              __xmlattr[AttrSource] = value
            end

            def xmlattr_relationship_type
              __xmlattr[AttrRelationshipType]
            end

            def xmlattr_relationship_type=(value)
              __xmlattr[AttrRelationshipType] = value
            end

            def initialize(location = nil, omim = [], haploinsufficiency = nil, triplosensitivity = nil, property = [])
              @location = location
              @omim = omim
              @haploinsufficiency = haploinsufficiency
              @triplosensitivity = triplosensitivity
              @property = property
              @__xmlattr = {}
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {
                Symbol: String,
                FullName: SOAP::SOAPString,
                GeneID: SOAP::SOAPPositiveInteger,
                HGNC_ID: SOAP::SOAPString,
                Source: SOAP::SOAPString,
                RelationshipType: SOAP::SOAPString
              }
            end

            def element_mapping
              @__element_mapping__ ||= {
                location: ClinVar::RDF::Model::TypeLocation,
                omim: SOAP::SOAPPositiveInteger,
                haploinsufficiency: ClinVar::RDF::Model::TypeAllele::GeneList::Gene::Haploinsufficiency,
                triplosensitivity: ClinVar::RDF::Model::TypeAllele::GeneList::Gene::Triplosensitivity,
                property: SOAP::SOAPString
              }
            end
          end

          include ModelHelper

          attr_accessor :gene

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_gene_count
            __xmlattr[AttrGeneCount]
          end

          def xmlattr_gene_count=(value)
            __xmlattr[AttrGeneCount] = value
          end

          def initialize(gene = [])
            @gene = gene
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              GeneCount: SOAP::SOAPInt
            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              gene: ClinVar::RDF::Model::TypeAllele::GeneList::Gene
            }
          end
        end

        # inner class for member: HGVSlist
        # {}HGVSlist
        class HGVSlist < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeHGVSExpression
          end
        end

        # inner class for member: XRefList
        # {}XRefList
        class XRefList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeXref
          end
        end

        # inner class for member: AlleleFrequencyList
        # {}AlleleFrequencyList
        class AlleleFrequencyList < ::Array

          # {}AlleleFrequency
          #   xmlattr_value - SOAP::SOAPDouble
          #   xmlattr_type - SOAP::SOAPString
          #   xmlattr_minor_allele - SOAP::SOAPString
          #   xmlattr_url - SOAP::SOAPAnyURI
          class AlleleFrequency
            AttrMinorAllele = XSD::QName.new(nil, "MinorAllele")
            AttrType = XSD::QName.new(nil, "Type")
            AttrURL = XSD::QName.new(nil, "URL")
            AttrValue = XSD::QName.new(nil, "Value")

            include ModelHelper

            def __xmlattr
              @__xmlattr ||= {}
            end

            def xmlattr_value
              __xmlattr[AttrValue]
            end

            def xmlattr_value=(value)
              __xmlattr[AttrValue] = value
            end

            def xmlattr_type
              __xmlattr[AttrType]
            end

            def xmlattr_type=(value)
              __xmlattr[AttrType] = value
            end

            def xmlattr_minor_allele
              __xmlattr[AttrMinorAllele]
            end

            def xmlattr_minor_allele=(value)
              __xmlattr[AttrMinorAllele] = value
            end

            def xmlattr_url
              __xmlattr[AttrURL]
            end

            def xmlattr_url=(value)
              __xmlattr[AttrURL] = value
            end

            def initialize(*args)
              @__xmlattr = {}
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {
                Value: SOAP::SOAPDouble,
                Type: SOAP::SOAPString,
                MinorAllele: SOAP::SOAPString,
                URL: SOAP::SOAPAnyURI
              }
            end

            def element_mapping
              @__element_mapping__ ||= {

              }
            end
          end

          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeAllele::AlleleFrequencyList::AlleleFrequency
          end
        end

        # inner class for member: GlobalMinorAlleleFrequency
        # {}GlobalMinorAlleleFrequency
        #   xmlattr_value - SOAP::SOAPDouble
        #   xmlattr_type - SOAP::SOAPString
        #   xmlattr_minor_allele - SOAP::SOAPString
        #   xmlattr_url - SOAP::SOAPAnyURI
        class GlobalMinorAlleleFrequency
          AttrMinorAllele = XSD::QName.new(nil, "MinorAllele")
          AttrType = XSD::QName.new(nil, "Type")
          AttrURL = XSD::QName.new(nil, "URL")
          AttrValue = XSD::QName.new(nil, "Value")

          include ModelHelper

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_value
            __xmlattr[AttrValue]
          end

          def xmlattr_value=(value)
            __xmlattr[AttrValue] = value
          end

          def xmlattr_type
            __xmlattr[AttrType]
          end

          def xmlattr_type=(value)
            __xmlattr[AttrType] = value
          end

          def xmlattr_minor_allele
            __xmlattr[AttrMinorAllele]
          end

          def xmlattr_minor_allele=(value)
            __xmlattr[AttrMinorAllele] = value
          end

          def xmlattr_url
            __xmlattr[AttrURL]
          end

          def xmlattr_url=(value)
            __xmlattr[AttrURL] = value
          end

          def initialize(*args)
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Value: SOAP::SOAPDouble,
              Type: SOAP::SOAPString,
              MinorAllele: SOAP::SOAPString,
              URL: SOAP::SOAPAnyURI
            }
          end

          def element_mapping
            @__element_mapping__ ||= {

            }
          end
        end

        # inner class for member: SuspectList
        # {}SuspectList
        class SuspectList < ::Array

          # {}Suspect
          #   x_ref - ClinVar::RDF::Model::TypeXref
          #   xmlattr_value - SOAP::SOAPString
          class Suspect
            AttrValue = XSD::QName.new(nil, "Value")

            include ModelHelper

            attr_accessor :x_ref

            def __xmlattr
              @__xmlattr ||= {}
            end

            def xmlattr_value
              __xmlattr[AttrValue]
            end

            def xmlattr_value=(value)
              __xmlattr[AttrValue] = value
            end

            def initialize(x_ref = [])
              @x_ref = x_ref
              @__xmlattr = {}
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {
                Value: SOAP::SOAPString
              }
            end

            def element_mapping
              @__element_mapping__ ||= {
                x_ref: ClinVar::RDF::Model::TypeXref
              }
            end
          end

          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeAllele::SuspectList::Suspect
          end
        end

        include ModelHelper

        attr_accessor :gene_list
        attr_accessor :name
        attr_accessor :variant_type
        attr_accessor :location
        attr_accessor :other_name_list
        attr_accessor :protein_change
        attr_accessor :hgv_slist
        attr_accessor :interpretations
        attr_accessor :x_ref_list
        attr_accessor :comment
        attr_accessor :functional_consequence
        attr_accessor :allele_frequency_list
        attr_accessor :global_minor_allele_frequency
        attr_accessor :suspect_list

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_allele_id
          __xmlattr[AttrAlleleID]
        end

        def xmlattr_allele_id=(value)
          __xmlattr[AttrAlleleID] = value
        end

        def xmlattr_variation_id
          __xmlattr[AttrVariationID]
        end

        def xmlattr_variation_id=(value)
          __xmlattr[AttrVariationID] = value
        end

        def initialize(gene_list = nil, name = nil, variant_type = nil, location = nil, other_name_list = nil, protein_change = [], hgv_slist = nil, interpretations = nil, x_ref_list = nil, comment = [], functional_consequence = [], allele_frequency_list = nil, global_minor_allele_frequency = nil, suspect_list = nil)
          @gene_list = gene_list
          @name = name
          @variant_type = variant_type
          @location = location
          @other_name_list = other_name_list
          @protein_change = protein_change
          @hgv_slist = hgv_slist
          @interpretations = interpretations
          @x_ref_list = x_ref_list
          @comment = comment
          @functional_consequence = functional_consequence
          @allele_frequency_list = allele_frequency_list
          @global_minor_allele_frequency = global_minor_allele_frequency
          @suspect_list = suspect_list
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            AlleleID: SOAP::SOAPInt,
            VariationID: SOAP::SOAPPositiveInteger
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            gene_list: ClinVar::RDF::Model::TypeAllele::GeneList,
            name: SOAP::SOAPString,
            variant_type: SOAP::SOAPString,
            location: ClinVar::RDF::Model::TypeLocation,
            other_name_list: ClinVar::RDF::Model::TypeNames,
            protein_change: SOAP::SOAPString,
            hgv_slist: ClinVar::RDF::Model::TypeAllele::HGVSlist,
            interpretations: ClinVar::RDF::Model::TypeAggregatedInterpretationSet,
            x_ref_list: ClinVar::RDF::Model::TypeAllele::XRefList,
            comment: ClinVar::RDF::Model::TypeComment,
            functional_consequence: ClinVar::RDF::Model::TypeFunctionalConsequence,
            allele_frequency_list: ClinVar::RDF::Model::TypeAllele::AlleleFrequencyList,
            global_minor_allele_frequency: ClinVar::RDF::Model::TypeAllele::GlobalMinorAlleleFrequency,
            suspect_list: ClinVar::RDF::Model::TypeAllele::SuspectList
          }
        end
      end

      # {}typeAlleleSCV
      #   gene_list - ClinVar::RDF::Model::TypeAlleleSCV::GeneList
      #   name - ClinVar::RDF::Model::TypeAlleleSCV::Name
      #   variant_type - SOAP::SOAPString
      #   location - ClinVar::RDF::Model::TypeLocation
      #   other_name_list - ClinVar::RDF::Model::TypeNames
      #   protein_change - SOAP::SOAPString
      #   x_ref_list - ClinVar::RDF::Model::TypeAlleleSCV::XRefList
      #   citation_list - ClinVar::RDF::Model::TypeAlleleSCV::CitationList
      #   comment - ClinVar::RDF::Model::TypeComment
      #   molecular_consequence_list - ClinVar::RDF::Model::TypeAlleleSCV::MolecularConsequenceList
      #   functional_consequence - ClinVar::RDF::Model::TypeFunctionalConsequence
      #   attribute_set - ClinVar::RDF::Model::TypeAttributeSet
      #   xmlattr_allele_id - SOAP::SOAPInt
      class TypeAlleleSCV
        AttrAlleleID = XSD::QName.new(nil, "AlleleID")

        # inner class for member: GeneList
        # {}GeneList
        class GeneList < ::Array

          # {}Gene
          #   name - SOAP::SOAPString
          #   property - SOAP::SOAPString
          #   x_ref - ClinVar::RDF::Model::TypeXref
          #   xmlattr_symbol - (any)
          #   xmlattr_relationship_type - SOAP::SOAPString
          class Gene
            AttrC_Symbol = XSD::QName.new(nil, "Symbol")
            AttrRelationshipType = XSD::QName.new(nil, "RelationshipType")

            include ModelHelper

            attr_accessor :name
            attr_accessor :property
            attr_accessor :x_ref

            def __xmlattr
              @__xmlattr ||= {}
            end

            def xmlattr_symbol
              __xmlattr[AttrC_Symbol]
            end

            def xmlattr_symbol=(value)
              __xmlattr[AttrC_Symbol] = value
            end

            def xmlattr_relationship_type
              __xmlattr[AttrRelationshipType]
            end

            def xmlattr_relationship_type=(value)
              __xmlattr[AttrRelationshipType] = value
            end

            def initialize(name = nil, property = [], x_ref = [])
              @name = name
              @property = property
              @x_ref = x_ref
              @__xmlattr = {}
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {
                Symbol: String,
                RelationshipType: SOAP::SOAPString
              }
            end

            def element_mapping
              @__element_mapping__ ||= {
                name: SOAP::SOAPString,
                property: SOAP::SOAPString,
                x_ref: ClinVar::RDF::Model::TypeXref
              }
            end
          end

          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeAlleleSCV::GeneList::Gene
          end
        end

        # inner class for member: Name
        # {}Name
        #   xmlattr_type - SOAP::SOAPString
        class Name < ::String
          AttrType = XSD::QName.new(nil, "Type")

          include ModelHelper

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_type
            __xmlattr[AttrType]
          end

          def xmlattr_type=(value)
            __xmlattr[AttrType] = value
          end

          def initialize(*arg)
            super
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Type: SOAP::SOAPString
            }
          end

          def element_mapping
            @__element_mapping__ ||= {

            }
          end
        end

        # inner class for member: XRefList
        # {}XRefList
        class XRefList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeXref
          end
        end

        # inner class for member: CitationList
        # {}CitationList
        class CitationList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeCitation
          end
        end

        # inner class for member: MolecularConsequenceList
        # {}MolecularConsequenceList
        class MolecularConsequenceList < ::Array

          # {}MolecularConsequence
          #   x_ref - ClinVar::RDF::Model::TypeXref
          #   citation - ClinVar::RDF::Model::TypeCitation
          #   comment - ClinVar::RDF::Model::TypeComment
          #   xmlattr_rs - SOAP::SOAPPositiveInteger
          #   xmlattr_hgvs - SOAP::SOAPString
          #   xmlattr_s_oid - SOAP::SOAPString
          #   xmlattr_function - SOAP::SOAPString
          class MolecularConsequence
            AttrFunction = XSD::QName.new(nil, "Function")
            AttrHGVS = XSD::QName.new(nil, "HGVS")
            AttrRS = XSD::QName.new(nil, "RS")
            AttrSOid = XSD::QName.new(nil, "SOid")

            include ModelHelper

            attr_accessor :x_ref
            attr_accessor :citation
            attr_accessor :comment

            def __xmlattr
              @__xmlattr ||= {}
            end

            def xmlattr_rs
              __xmlattr[AttrRS]
            end

            def xmlattr_rs=(value)
              __xmlattr[AttrRS] = value
            end

            def xmlattr_hgvs
              __xmlattr[AttrHGVS]
            end

            def xmlattr_hgvs=(value)
              __xmlattr[AttrHGVS] = value
            end

            def xmlattr_s_oid
              __xmlattr[AttrSOid]
            end

            def xmlattr_s_oid=(value)
              __xmlattr[AttrSOid] = value
            end

            def xmlattr_function
              __xmlattr[AttrFunction]
            end

            def xmlattr_function=(value)
              __xmlattr[AttrFunction] = value
            end

            def initialize(x_ref = [], citation = [], comment = [])
              @x_ref = x_ref
              @citation = citation
              @comment = comment
              @__xmlattr = {}
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {
                RS: SOAP::SOAPPositiveInteger,
                HGVS: SOAP::SOAPString,
                SOid: SOAP::SOAPString,
                Function: SOAP::SOAPString
              }
            end

            def element_mapping
              @__element_mapping__ ||= {
                x_ref: ClinVar::RDF::Model::TypeXref,
                citation: ClinVar::RDF::Model::TypeCitation,
                comment: ClinVar::RDF::Model::TypeComment
              }
            end
          end

          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeAlleleSCV::MolecularConsequenceList::MolecularConsequence
          end
        end

        include ModelHelper

        attr_accessor :gene_list
        attr_accessor :name
        attr_accessor :variant_type
        attr_accessor :location
        attr_accessor :other_name_list
        attr_accessor :protein_change
        attr_accessor :x_ref_list
        attr_accessor :citation_list
        attr_accessor :comment
        attr_accessor :molecular_consequence_list
        attr_accessor :functional_consequence
        attr_accessor :attribute_set

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_allele_id
          __xmlattr[AttrAlleleID]
        end

        def xmlattr_allele_id=(value)
          __xmlattr[AttrAlleleID] = value
        end

        def initialize(gene_list = nil, name = [], variant_type = nil, location = nil, other_name_list = nil, protein_change = [], x_ref_list = nil, citation_list = nil, comment = [], molecular_consequence_list = nil, functional_consequence = [], attribute_set = [])
          @gene_list = gene_list
          @name = name
          @variant_type = variant_type
          @location = location
          @other_name_list = other_name_list
          @protein_change = protein_change
          @x_ref_list = x_ref_list
          @citation_list = citation_list
          @comment = comment
          @molecular_consequence_list = molecular_consequence_list
          @functional_consequence = functional_consequence
          @attribute_set = attribute_set
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            AlleleID: SOAP::SOAPInt
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            gene_list: ClinVar::RDF::Model::TypeAlleleSCV::GeneList,
            name: ClinVar::RDF::Model::TypeAlleleSCV::Name,
            variant_type: SOAP::SOAPString,
            location: ClinVar::RDF::Model::TypeLocation,
            other_name_list: ClinVar::RDF::Model::TypeNames,
            protein_change: SOAP::SOAPString,
            x_ref_list: ClinVar::RDF::Model::TypeAlleleSCV::XRefList,
            citation_list: ClinVar::RDF::Model::TypeAlleleSCV::CitationList,
            comment: ClinVar::RDF::Model::TypeComment,
            molecular_consequence_list: ClinVar::RDF::Model::TypeAlleleSCV::MolecularConsequenceList,
            functional_consequence: ClinVar::RDF::Model::TypeFunctionalConsequence,
            attribute_set: ClinVar::RDF::Model::TypeAttributeSet
          }
        end
      end

      # {}typeGenotype
      #   simple_allele - ClinVar::RDF::Model::TypeAllele
      #   haplotype - ClinVar::RDF::Model::TypeHaplotype
      #   name - SOAP::SOAPString
      #   variation_type - ClinVar::RDF::Model::TypeVariationType
      #   other_name_list - ClinVar::RDF::Model::TypeNames
      #   hgv_slist - ClinVar::RDF::Model::TypeGenotype::HGVSlist
      #   functional_consequence - ClinVar::RDF::Model::TypeGenotype::FunctionalConsequence
      #   interpretations - ClinVar::RDF::Model::TypeAggregatedInterpretationSet
      #   x_ref_list - ClinVar::RDF::Model::TypeGenotype::XRefList
      #   citation_list - ClinVar::RDF::Model::TypeGenotype::CitationList
      #   comment - ClinVar::RDF::Model::TypeComment
      #   attribute_set - ClinVar::RDF::Model::TypeAttributeSet
      #   xmlattr_variation_id - SOAP::SOAPInt
      class TypeGenotype
        AttrVariationID = XSD::QName.new(nil, "VariationID")

        # inner class for member: HGVSlist
        # {}HGVSlist
        class HGVSlist < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeHGVSExpression
          end
        end

        # inner class for member: FunctionalConsequence
        # {}FunctionalConsequence
        #   x_ref - ClinVar::RDF::Model::TypeXref
        #   citation - ClinVar::RDF::Model::TypeCitation
        #   comment - ClinVar::RDF::Model::TypeComment
        #   xmlattr_value - SOAP::SOAPString
        class FunctionalConsequence
          AttrValue = XSD::QName.new(nil, "Value")

          include ModelHelper

          attr_accessor :x_ref
          attr_accessor :citation
          attr_accessor :comment

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_value
            __xmlattr[AttrValue]
          end

          def xmlattr_value=(value)
            __xmlattr[AttrValue] = value
          end

          def initialize(x_ref = [], citation = [], comment = [])
            @x_ref = x_ref
            @citation = citation
            @comment = comment
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Value: SOAP::SOAPString
            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              x_ref: ClinVar::RDF::Model::TypeXref,
              citation: ClinVar::RDF::Model::TypeCitation,
              comment: ClinVar::RDF::Model::TypeComment
            }
          end
        end

        # inner class for member: XRefList
        # {}XRefList
        class XRefList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeXref
          end
        end

        # inner class for member: CitationList
        # {}CitationList
        class CitationList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeCitation
          end
        end

        include ModelHelper

        attr_accessor :simple_allele
        attr_accessor :haplotype
        attr_accessor :name
        attr_accessor :variation_type
        attr_accessor :other_name_list
        attr_accessor :hgv_slist
        attr_accessor :functional_consequence
        attr_accessor :interpretations
        attr_accessor :x_ref_list
        attr_accessor :citation_list
        attr_accessor :comment
        attr_accessor :attribute_set

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_variation_id
          __xmlattr[AttrVariationID]
        end

        def xmlattr_variation_id=(value)
          __xmlattr[AttrVariationID] = value
        end

        def initialize(simple_allele = [], haplotype = [], name = nil, variation_type = nil, other_name_list = nil, hgv_slist = nil, functional_consequence = [], interpretations = [], x_ref_list = nil, citation_list = nil, comment = [], attribute_set = [])
          @simple_allele = simple_allele
          @haplotype = haplotype
          @name = name
          @variation_type = variation_type
          @other_name_list = other_name_list
          @hgv_slist = hgv_slist
          @functional_consequence = functional_consequence
          @interpretations = interpretations
          @x_ref_list = x_ref_list
          @citation_list = citation_list
          @comment = comment
          @attribute_set = attribute_set
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            VariationID: SOAP::SOAPInt
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            simple_allele: ClinVar::RDF::Model::TypeAllele,
            haplotype: ClinVar::RDF::Model::TypeHaplotype,
            name: SOAP::SOAPString,
            variation_type: ClinVar::RDF::Model::TypeVariationType,
            other_name_list: ClinVar::RDF::Model::TypeNames,
            hgv_slist: ClinVar::RDF::Model::TypeGenotype::HGVSlist,
            functional_consequence: ClinVar::RDF::Model::TypeGenotype::FunctionalConsequence,
            interpretations: ClinVar::RDF::Model::TypeAggregatedInterpretationSet,
            x_ref_list: ClinVar::RDF::Model::TypeGenotype::XRefList,
            citation_list: ClinVar::RDF::Model::TypeGenotype::CitationList,
            comment: ClinVar::RDF::Model::TypeComment,
            attribute_set: ClinVar::RDF::Model::TypeAttributeSet
          }
        end
      end

      # {}typeXref
      #   xmlattr_db - SOAP::SOAPString
      #   xmlattr_id - SOAP::SOAPString
      #   xmlattr_type - SOAP::SOAPString
      #   xmlattr_url - SOAP::SOAPAnyURI
      #   xmlattr_status - SOAP::SOAPString
      class TypeXref
        AttrDB = XSD::QName.new(nil, "DB")
        AttrID = XSD::QName.new(nil, "ID")
        AttrStatus = XSD::QName.new(nil, "Status")
        AttrType = XSD::QName.new(nil, "Type")
        AttrURL = XSD::QName.new(nil, "URL")

        include ModelHelper

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_db
          __xmlattr[AttrDB]
        end

        def xmlattr_db=(value)
          __xmlattr[AttrDB] = value
        end

        def xmlattr_id
          __xmlattr[AttrID]
        end

        def xmlattr_id=(value)
          __xmlattr[AttrID] = value
        end

        def xmlattr_type
          __xmlattr[AttrType]
        end

        def xmlattr_type=(value)
          __xmlattr[AttrType] = value
        end

        def xmlattr_url
          __xmlattr[AttrURL]
        end

        def xmlattr_url=(value)
          __xmlattr[AttrURL] = value
        end

        def xmlattr_status
          __xmlattr[AttrStatus]
        end

        def xmlattr_status=(value)
          __xmlattr[AttrStatus] = value
        end

        def initialize(*args)
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            DB: SOAP::SOAPString,
            ID: SOAP::SOAPString,
            Type: SOAP::SOAPString,
            URL: SOAP::SOAPAnyURI,
            Status: SOAP::SOAPString
          }
        end

        def element_mapping
          @__element_mapping__ ||= {

          }
        end
      end

      # {}SubmitterType
      #   xmlattr_submitter_name - SOAP::SOAPString
      #   xmlattr_org_id - SOAP::SOAPPositiveInteger
      #   xmlattr_organization_category - SOAP::SOAPString
      #   xmlattr_org_abbreviation - SOAP::SOAPString
      #   xmlattr_type - SOAP::SOAPString
      class SubmitterType
        AttrOrgAbbreviation = XSD::QName.new(nil, "OrgAbbreviation")
        AttrOrgID = XSD::QName.new(nil, "OrgID")
        AttrOrganizationCategory = XSD::QName.new(nil, "OrganizationCategory")
        AttrSubmitterName = XSD::QName.new(nil, "SubmitterName")
        AttrType = XSD::QName.new(nil, "Type")

        include ModelHelper

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_submitter_name
          __xmlattr[AttrSubmitterName]
        end

        def xmlattr_submitter_name=(value)
          __xmlattr[AttrSubmitterName] = value
        end

        def xmlattr_org_id
          __xmlattr[AttrOrgID]
        end

        def xmlattr_org_id=(value)
          __xmlattr[AttrOrgID] = value
        end

        def xmlattr_organization_category
          __xmlattr[AttrOrganizationCategory]
        end

        def xmlattr_organization_category=(value)
          __xmlattr[AttrOrganizationCategory] = value
        end

        def xmlattr_org_abbreviation
          __xmlattr[AttrOrgAbbreviation]
        end

        def xmlattr_org_abbreviation=(value)
          __xmlattr[AttrOrgAbbreviation] = value
        end

        def xmlattr_type
          __xmlattr[AttrType]
        end

        def xmlattr_type=(value)
          __xmlattr[AttrType] = value
        end

        def initialize(*args)
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            SubmitterName: SOAP::SOAPString,
            OrgID: SOAP::SOAPPositiveInteger,
            OrganizationCategory: SOAP::SOAPString,
            OrgAbbreviation: SOAP::SOAPString,
            Type: SOAP::SOAPString
          }
        end

        def element_mapping
          @__element_mapping__ ||= {

          }
        end
      end

      # {}typeNames
      class TypeNames < ::Array

        # {}Name
        #   xmlattr_type - SOAP::SOAPString
        class Name < ::String
          AttrType = XSD::QName.new(nil, "Type")

          include ModelHelper

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_type
            __xmlattr[AttrType]
          end

          def xmlattr_type=(value)
            __xmlattr[AttrType] = value
          end

          def initialize(*arg)
            super
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Type: SOAP::SOAPString
            }
          end

          def element_mapping
            @__element_mapping__ ||= {

            }
          end
        end

        include ModelHelper

        def self.element_type
          ClinVar::RDF::Model::TypeNames::Name
        end
      end

      # {}typeEvidenceObservation
      #   method - ClinVar::RDF::Model::TypeMethodRefs
      #   mode_of_inheritance - SOAP::SOAPString
      #   citation_list - ClinVar::RDF::Model::TypeEvidenceObservation::CitationList
      #   description - ClinVar::RDF::Model::TypeComment
      #   observed_phenotypes - ClinVar::RDF::Model::PhenotypeListDetailsType
      #   indications - ClinVar::RDF::Model::IndicationListType
      #   xmlattr_submitter_name - SOAP::SOAPString
      #   xmlattr_org_id - SOAP::SOAPPositiveInteger
      #   xmlattr_organization_category - SOAP::SOAPString
      #   xmlattr_org_abbreviation - SOAP::SOAPString
      #   xmlattr_families - (any)
      #   xmlattr_individuals - (any)
      #   xmlattr_segregation - (any)
      #   xmlattr_other_gene - (any)
      #   xmlattr_same_gene - (any)
      #   xmlattr_type - SOAP::SOAPString
      #   xmlattr_allele_frequency - SOAP::SOAPString
      #   xmlattr_allele_origin - SOAP::SOAPString
      #   xmlattr_allele_origin_times_observed - SOAP::SOAPInt
      #   xmlattr_ethnicity - SOAP::SOAPString
      #   xmlattr_geographic_origin - SOAP::SOAPString
      class TypeEvidenceObservation
        AttrAlleleFrequency = XSD::QName.new(nil, "AlleleFrequency")
        AttrAlleleOrigin = XSD::QName.new(nil, "AlleleOrigin")
        AttrAlleleOriginTimesObserved = XSD::QName.new(nil, "AlleleOriginTimesObserved")
        AttrEthnicity = XSD::QName.new(nil, "Ethnicity")
        AttrFamilies = XSD::QName.new(nil, "Families")
        AttrGeographicOrigin = XSD::QName.new(nil, "GeographicOrigin")
        AttrIndividuals = XSD::QName.new(nil, "Individuals")
        AttrOrgAbbreviation = XSD::QName.new(nil, "OrgAbbreviation")
        AttrOrgID = XSD::QName.new(nil, "OrgID")
        AttrOrganizationCategory = XSD::QName.new(nil, "OrganizationCategory")
        AttrOtherGene = XSD::QName.new(nil, "OtherGene")
        AttrSameGene = XSD::QName.new(nil, "SameGene")
        AttrSegregation = XSD::QName.new(nil, "Segregation")
        AttrSubmitterName = XSD::QName.new(nil, "SubmitterName")
        AttrType = XSD::QName.new(nil, "Type")

        # inner class for member: CitationList
        # {}CitationList
        class CitationList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeCitation
          end
        end

        include ModelHelper

        attr_accessor :method
        attr_accessor :mode_of_inheritance
        attr_accessor :citation_list
        attr_accessor :description
        attr_accessor :observed_phenotypes
        attr_accessor :indications

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_submitter_name
          __xmlattr[AttrSubmitterName]
        end

        def xmlattr_submitter_name=(value)
          __xmlattr[AttrSubmitterName] = value
        end

        def xmlattr_org_id
          __xmlattr[AttrOrgID]
        end

        def xmlattr_org_id=(value)
          __xmlattr[AttrOrgID] = value
        end

        def xmlattr_organization_category
          __xmlattr[AttrOrganizationCategory]
        end

        def xmlattr_organization_category=(value)
          __xmlattr[AttrOrganizationCategory] = value
        end

        def xmlattr_org_abbreviation
          __xmlattr[AttrOrgAbbreviation]
        end

        def xmlattr_org_abbreviation=(value)
          __xmlattr[AttrOrgAbbreviation] = value
        end

        def xmlattr_families
          __xmlattr[AttrFamilies]
        end

        def xmlattr_families=(value)
          __xmlattr[AttrFamilies] = value
        end

        def xmlattr_individuals
          __xmlattr[AttrIndividuals]
        end

        def xmlattr_individuals=(value)
          __xmlattr[AttrIndividuals] = value
        end

        def xmlattr_segregation
          __xmlattr[AttrSegregation]
        end

        def xmlattr_segregation=(value)
          __xmlattr[AttrSegregation] = value
        end

        def xmlattr_other_gene
          __xmlattr[AttrOtherGene]
        end

        def xmlattr_other_gene=(value)
          __xmlattr[AttrOtherGene] = value
        end

        def xmlattr_same_gene
          __xmlattr[AttrSameGene]
        end

        def xmlattr_same_gene=(value)
          __xmlattr[AttrSameGene] = value
        end

        def xmlattr_type
          __xmlattr[AttrType]
        end

        def xmlattr_type=(value)
          __xmlattr[AttrType] = value
        end

        def xmlattr_allele_frequency
          __xmlattr[AttrAlleleFrequency]
        end

        def xmlattr_allele_frequency=(value)
          __xmlattr[AttrAlleleFrequency] = value
        end

        def xmlattr_allele_origin
          __xmlattr[AttrAlleleOrigin]
        end

        def xmlattr_allele_origin=(value)
          __xmlattr[AttrAlleleOrigin] = value
        end

        def xmlattr_allele_origin_times_observed
          __xmlattr[AttrAlleleOriginTimesObserved]
        end

        def xmlattr_allele_origin_times_observed=(value)
          __xmlattr[AttrAlleleOriginTimesObserved] = value
        end

        def xmlattr_ethnicity
          __xmlattr[AttrEthnicity]
        end

        def xmlattr_ethnicity=(value)
          __xmlattr[AttrEthnicity] = value
        end

        def xmlattr_geographic_origin
          __xmlattr[AttrGeographicOrigin]
        end

        def xmlattr_geographic_origin=(value)
          __xmlattr[AttrGeographicOrigin] = value
        end

        def initialize(method = [], mode_of_inheritance = [], citation_list = nil, description = [], observed_phenotypes = nil, indications = nil)
          @method = method
          @mode_of_inheritance = mode_of_inheritance
          @citation_list = citation_list
          @description = description
          @observed_phenotypes = observed_phenotypes
          @indications = indications
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            SubmitterName: SOAP::SOAPString,
            OrgID: SOAP::SOAPPositiveInteger,
            OrganizationCategory: SOAP::SOAPString,
            OrgAbbreviation: SOAP::SOAPString,
            Families: String,
            Individuals: String,
            Segregation: String,
            OtherGene: String,
            SameGene: String,
            Type: SOAP::SOAPString,
            AlleleFrequency: SOAP::SOAPString,
            AlleleOrigin: SOAP::SOAPString,
            AlleleOriginTimesObserved: SOAP::SOAPInt,
            Ethnicity: SOAP::SOAPString,
            GeographicOrigin: SOAP::SOAPString
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            method: ClinVar::RDF::Model::TypeMethodRefs,
            mode_of_inheritance: SOAP::SOAPString,
            citation_list: ClinVar::RDF::Model::TypeEvidenceObservation::CitationList,
            description: ClinVar::RDF::Model::TypeComment,
            observed_phenotypes: ClinVar::RDF::Model::PhenotypeListDetailsType,
            indications: ClinVar::RDF::Model::IndicationListType
          }
        end
      end

      # {}typeCitation
      #   id - ClinVar::RDF::Model::TypeCitation::ID
      #   url - SOAP::SOAPAnyURI
      #   citation_text - SOAP::SOAPString
      #   xmlattr_type - SOAP::SOAPString
      #   xmlattr_abbrev - SOAP::SOAPString
      class TypeCitation
        AttrAbbrev = XSD::QName.new(nil, "Abbrev")
        AttrType = XSD::QName.new(nil, "Type")

        # inner class for member: ID
        # {}ID
        #   xmlattr_source - SOAP::SOAPString
        class ID < ::String
          AttrSource = XSD::QName.new(nil, "Source")

          include ModelHelper

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_source
            __xmlattr[AttrSource]
          end

          def xmlattr_source=(value)
            __xmlattr[AttrSource] = value
          end

          def initialize(*arg)
            super
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Source: SOAP::SOAPString
            }
          end

          def element_mapping
            @__element_mapping__ ||= {

            }
          end
        end

        include ModelHelper

        attr_accessor :id
        attr_accessor :url
        attr_accessor :citation_text

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_type
          __xmlattr[AttrType]
        end

        def xmlattr_type=(value)
          __xmlattr[AttrType] = value
        end

        def xmlattr_abbrev
          __xmlattr[AttrAbbrev]
        end

        def xmlattr_abbrev=(value)
          __xmlattr[AttrAbbrev] = value
        end

        def initialize(id = [], url = nil, citation_text = nil)
          @id = id
          @url = url
          @citation_text = citation_text
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            Type: SOAP::SOAPString,
            Abbrev: SOAP::SOAPString
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            id: ClinVar::RDF::Model::TypeCitation::ID,
            url: SOAP::SOAPAnyURI,
            citation_text: SOAP::SOAPString
          }
        end
      end

      # {}typeNucleotideSequenceExpression
      #   expression - SOAP::SOAPString
      #   xmlattr_sequence_type - SOAP::SOAPString
      #   xmlattr_sequence_accession_version - (any)
      #   xmlattr_sequence_accession - (any)
      #   xmlattr_sequence_version - (any)
      #   xmlattr_change - (any)
      #   xmlattr_assembly - (any)
      #   xmlattr_submitted - (any)
      class TypeNucleotideSequenceExpression
        AttrAssembly = XSD::QName.new(nil, "Assembly")
        AttrChange = XSD::QName.new(nil, "change")
        AttrSequenceAccession = XSD::QName.new(nil, "sequenceAccession")
        AttrSequenceAccessionVersion = XSD::QName.new(nil, "sequenceAccessionVersion")
        AttrSequenceType = XSD::QName.new(nil, "sequenceType")
        AttrSequenceVersion = XSD::QName.new(nil, "sequenceVersion")
        AttrSubmitted = XSD::QName.new(nil, "Submitted")

        include ModelHelper

        attr_accessor :expression

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_sequence_type
          __xmlattr[AttrSequenceType]
        end

        def xmlattr_sequence_type=(value)
          __xmlattr[AttrSequenceType] = value
        end

        def xmlattr_sequence_accession_version
          __xmlattr[AttrSequenceAccessionVersion]
        end

        def xmlattr_sequence_accession_version=(value)
          __xmlattr[AttrSequenceAccessionVersion] = value
        end

        def xmlattr_sequence_accession
          __xmlattr[AttrSequenceAccession]
        end

        def xmlattr_sequence_accession=(value)
          __xmlattr[AttrSequenceAccession] = value
        end

        def xmlattr_sequence_version
          __xmlattr[AttrSequenceVersion]
        end

        def xmlattr_sequence_version=(value)
          __xmlattr[AttrSequenceVersion] = value
        end

        def xmlattr_change
          __xmlattr[AttrChange]
        end

        def xmlattr_change=(value)
          __xmlattr[AttrChange] = value
        end

        def xmlattr_assembly
          __xmlattr[AttrAssembly]
        end

        def xmlattr_assembly=(value)
          __xmlattr[AttrAssembly] = value
        end

        def xmlattr_submitted
          __xmlattr[AttrSubmitted]
        end

        def xmlattr_submitted=(value)
          __xmlattr[AttrSubmitted] = value
        end

        def initialize(expression = nil)
          @expression = expression
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            sequenceType: SOAP::SOAPString,
            sequenceAccessionVersion: String,
            sequenceAccession: String,
            sequenceVersion: String,
            change: String,
            Assembly: String,
            Submitted: String
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            expression: SOAP::SOAPString
          }
        end
      end

      # {}typeProteinSequenceExpression
      #   expression - SOAP::SOAPString
      #   xmlattr_sequence_accession_version - (any)
      #   xmlattr_sequence_accession - (any)
      #   xmlattr_sequence_version - (any)
      #   xmlattr_change - (any)
      class TypeProteinSequenceExpression
        AttrChange = XSD::QName.new(nil, "change")
        AttrSequenceAccession = XSD::QName.new(nil, "sequenceAccession")
        AttrSequenceAccessionVersion = XSD::QName.new(nil, "sequenceAccessionVersion")
        AttrSequenceVersion = XSD::QName.new(nil, "sequenceVersion")

        include ModelHelper

        attr_accessor :expression

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_sequence_accession_version
          __xmlattr[AttrSequenceAccessionVersion]
        end

        def xmlattr_sequence_accession_version=(value)
          __xmlattr[AttrSequenceAccessionVersion] = value
        end

        def xmlattr_sequence_accession
          __xmlattr[AttrSequenceAccession]
        end

        def xmlattr_sequence_accession=(value)
          __xmlattr[AttrSequenceAccession] = value
        end

        def xmlattr_sequence_version
          __xmlattr[AttrSequenceVersion]
        end

        def xmlattr_sequence_version=(value)
          __xmlattr[AttrSequenceVersion] = value
        end

        def xmlattr_change
          __xmlattr[AttrChange]
        end

        def xmlattr_change=(value)
          __xmlattr[AttrChange] = value
        end

        def initialize(expression = nil)
          @expression = expression
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            sequenceAccessionVersion: String,
            sequenceAccession: String,
            sequenceVersion: String,
            change: String
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            expression: SOAP::SOAPString
          }
        end
      end

      # {}PhenotypeListDetailsType
      #   phenotype - ClinVar::RDF::Model::PhenotypeListDetailsType::Phenotype
      #   phenotype_details - ClinVar::RDF::Model::PhenotypeListDetailsType::PhenotypeDetails
      #   xmlattr_phenotype_set_type - SOAP::SOAPString
      class PhenotypeListDetailsType
        AttrPhenotypeSetType = XSD::QName.new(nil, "PhenotypeSetType")

        # inner class for member: Phenotype
        # {}Phenotype
        #   x_ref_list - ClinVar::RDF::Model::PhenotypeListDetailsType::Phenotype::XRefList
        #   xmlattr_name - SOAP::SOAPString
        #   xmlattr_target_id - SOAP::SOAPInt
        #   xmlattr_affected_status - SOAP::SOAPString
        class Phenotype
          AttrAffectedStatus = XSD::QName.new(nil, "AffectedStatus")
          AttrName = XSD::QName.new(nil, "Name")
          AttrTarget_id = XSD::QName.new(nil, "target_id")

          # inner class for member: XRefList
          # {}XRefList
          class XRefList < ::Array
            include ModelHelper

            def self.element_type
              ClinVar::RDF::Model::TypeXref
            end
          end

          include ModelHelper

          attr_accessor :x_ref_list

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_name
            __xmlattr[AttrName]
          end

          def xmlattr_name=(value)
            __xmlattr[AttrName] = value
          end

          def xmlattr_target_id
            __xmlattr[AttrTarget_id]
          end

          def xmlattr_target_id=(value)
            __xmlattr[AttrTarget_id] = value
          end

          def xmlattr_affected_status
            __xmlattr[AttrAffectedStatus]
          end

          def xmlattr_affected_status=(value)
            __xmlattr[AttrAffectedStatus] = value
          end

          def initialize(x_ref_list = nil)
            @x_ref_list = x_ref_list
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Name: SOAP::SOAPString,
              target_id: SOAP::SOAPInt,
              AffectedStatus: SOAP::SOAPString
            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              x_ref_list: ClinVar::RDF::Model::PhenotypeListDetailsType::Phenotype::XRefList
            }
          end
        end

        # inner class for member: PhenotypeDetails
        # {}PhenotypeDetails
        #   x_ref_list - ClinVar::RDF::Model::PhenotypeListDetailsType::PhenotypeDetails::XRefList
        #   xmlattr_submitter_name - SOAP::SOAPString
        #   xmlattr_org_id - SOAP::SOAPPositiveInteger
        #   xmlattr_organization_category - SOAP::SOAPString
        #   xmlattr_org_abbreviation - SOAP::SOAPString
        #   xmlattr_type - SOAP::SOAPString
        #   xmlattr_person_id - SOAP::SOAPString
        #   xmlattr_date_evaluated - SOAP::SOAPDate
        #   xmlattr_phenotype_name - SOAP::SOAPString
        #   xmlattr_affected_status - SOAP::SOAPString
        #   xmlattr_loinc - SOAP::SOAPString
        #   xmlattr_observed_value - SOAP::SOAPString
        #   xmlattr_interpretation - SOAP::SOAPString
        #   xmlattr_source_laboratory - SOAP::SOAPString
        class PhenotypeDetails
          AttrAffectedStatus = XSD::QName.new(nil, "AffectedStatus")
          AttrDateEvaluated = XSD::QName.new(nil, "DateEvaluated")
          AttrInterpretation = XSD::QName.new(nil, "Interpretation")
          AttrLOINC = XSD::QName.new(nil, "LOINC")
          AttrObservedValue = XSD::QName.new(nil, "ObservedValue")
          AttrOrgAbbreviation = XSD::QName.new(nil, "OrgAbbreviation")
          AttrOrgID = XSD::QName.new(nil, "OrgID")
          AttrOrganizationCategory = XSD::QName.new(nil, "OrganizationCategory")
          AttrPersonID = XSD::QName.new(nil, "PersonID")
          AttrPhenotypeName = XSD::QName.new(nil, "PhenotypeName")
          AttrSourceLaboratory = XSD::QName.new(nil, "SourceLaboratory")
          AttrSubmitterName = XSD::QName.new(nil, "SubmitterName")
          AttrType = XSD::QName.new(nil, "Type")

          # inner class for member: XRefList
          # {}XRefList
          class XRefList < ::Array
            include ModelHelper

            def self.element_type
              ClinVar::RDF::Model::TypeXref
            end
          end

          include ModelHelper

          attr_accessor :x_ref_list

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_submitter_name
            __xmlattr[AttrSubmitterName]
          end

          def xmlattr_submitter_name=(value)
            __xmlattr[AttrSubmitterName] = value
          end

          def xmlattr_org_id
            __xmlattr[AttrOrgID]
          end

          def xmlattr_org_id=(value)
            __xmlattr[AttrOrgID] = value
          end

          def xmlattr_organization_category
            __xmlattr[AttrOrganizationCategory]
          end

          def xmlattr_organization_category=(value)
            __xmlattr[AttrOrganizationCategory] = value
          end

          def xmlattr_org_abbreviation
            __xmlattr[AttrOrgAbbreviation]
          end

          def xmlattr_org_abbreviation=(value)
            __xmlattr[AttrOrgAbbreviation] = value
          end

          def xmlattr_type
            __xmlattr[AttrType]
          end

          def xmlattr_type=(value)
            __xmlattr[AttrType] = value
          end

          def xmlattr_person_id
            __xmlattr[AttrPersonID]
          end

          def xmlattr_person_id=(value)
            __xmlattr[AttrPersonID] = value
          end

          def xmlattr_date_evaluated
            __xmlattr[AttrDateEvaluated]
          end

          def xmlattr_date_evaluated=(value)
            __xmlattr[AttrDateEvaluated] = value
          end

          def xmlattr_phenotype_name
            __xmlattr[AttrPhenotypeName]
          end

          def xmlattr_phenotype_name=(value)
            __xmlattr[AttrPhenotypeName] = value
          end

          def xmlattr_affected_status
            __xmlattr[AttrAffectedStatus]
          end

          def xmlattr_affected_status=(value)
            __xmlattr[AttrAffectedStatus] = value
          end

          def xmlattr_loinc
            __xmlattr[AttrLOINC]
          end

          def xmlattr_loinc=(value)
            __xmlattr[AttrLOINC] = value
          end

          def xmlattr_observed_value
            __xmlattr[AttrObservedValue]
          end

          def xmlattr_observed_value=(value)
            __xmlattr[AttrObservedValue] = value
          end

          def xmlattr_interpretation
            __xmlattr[AttrInterpretation]
          end

          def xmlattr_interpretation=(value)
            __xmlattr[AttrInterpretation] = value
          end

          def xmlattr_source_laboratory
            __xmlattr[AttrSourceLaboratory]
          end

          def xmlattr_source_laboratory=(value)
            __xmlattr[AttrSourceLaboratory] = value
          end

          def initialize(x_ref_list = nil)
            @x_ref_list = x_ref_list
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              SubmitterName: SOAP::SOAPString,
              OrgID: SOAP::SOAPPositiveInteger,
              OrganizationCategory: SOAP::SOAPString,
              OrgAbbreviation: SOAP::SOAPString,
              Type: SOAP::SOAPString,
              PersonID: SOAP::SOAPString,
              DateEvaluated: SOAP::SOAPDate,
              PhenotypeName: SOAP::SOAPString,
              AffectedStatus: SOAP::SOAPString,
              LOINC: SOAP::SOAPString,
              ObservedValue: SOAP::SOAPString,
              Interpretation: SOAP::SOAPString,
              SourceLaboratory: SOAP::SOAPString
            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              x_ref_list: ClinVar::RDF::Model::PhenotypeListDetailsType::PhenotypeDetails::XRefList
            }
          end
        end

        include ModelHelper

        attr_accessor :phenotype
        attr_accessor :phenotype_details

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_phenotype_set_type
          __xmlattr[AttrPhenotypeSetType]
        end

        def xmlattr_phenotype_set_type=(value)
          __xmlattr[AttrPhenotypeSetType] = value
        end

        def initialize(phenotype = [], phenotype_details = [])
          @phenotype = phenotype
          @phenotype_details = phenotype_details
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            PhenotypeSetType: SOAP::SOAPString
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            phenotype: ClinVar::RDF::Model::PhenotypeListDetailsType::Phenotype,
            phenotype_details: ClinVar::RDF::Model::PhenotypeListDetailsType::PhenotypeDetails
          }
        end
      end

      # {}IndicationListType
      #   indication - ClinVar::RDF::Model::IndicationListType::Indication
      #   xmlattr_phenotype_set_type - SOAP::SOAPString
      class IndicationListType
        AttrPhenotypeSetType = XSD::QName.new(nil, "PhenotypeSetType")

        # inner class for member: Indication
        # {}Indication
        #   x_ref_list - ClinVar::RDF::Model::IndicationListType::Indication::XRefList
        #   xmlattr_name - SOAP::SOAPString
        #   xmlattr_target_id - SOAP::SOAPInt
        class Indication
          AttrName = XSD::QName.new(nil, "Name")
          AttrTarget_id = XSD::QName.new(nil, "target_id")

          # inner class for member: XRefList
          # {}XRefList
          class XRefList < ::Array
            include ModelHelper

            def self.element_type
              ClinVar::RDF::Model::TypeXref
            end
          end

          include ModelHelper

          attr_accessor :x_ref_list

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_name
            __xmlattr[AttrName]
          end

          def xmlattr_name=(value)
            __xmlattr[AttrName] = value
          end

          def xmlattr_target_id
            __xmlattr[AttrTarget_id]
          end

          def xmlattr_target_id=(value)
            __xmlattr[AttrTarget_id] = value
          end

          def initialize(x_ref_list = nil)
            @x_ref_list = x_ref_list
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Name: SOAP::SOAPString,
              target_id: SOAP::SOAPInt
            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              x_ref_list: ClinVar::RDF::Model::IndicationListType::Indication::XRefList
            }
          end
        end

        include ModelHelper

        attr_accessor :indication

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_phenotype_set_type
          __xmlattr[AttrPhenotypeSetType]
        end

        def xmlattr_phenotype_set_type=(value)
          __xmlattr[AttrPhenotypeSetType] = value
        end

        def initialize(indication = [])
          @indication = indication
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            PhenotypeSetType: SOAP::SOAPString
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            indication: ClinVar::RDF::Model::IndicationListType::Indication
          }
        end
      end

      # {}PharmaType
      class PharmaType < ::Array

        # {}DrugResponse
        #   phenotype_list - ClinVar::RDF::Model::PhenotypeListDetailsType
        #   x_ref_list - ClinVar::RDF::Model::PharmaType::DrugResponse::XRefList
        #   xmlattr_name - SOAP::SOAPString
        #   xmlattr_target_id - SOAP::SOAPInt
        class DrugResponse
          AttrName = XSD::QName.new(nil, "Name")
          AttrTarget_id = XSD::QName.new(nil, "target_id")

          # inner class for member: XRefList
          # {}XRefList
          class XRefList < ::Array
            include ModelHelper

            def self.element_type
              ClinVar::RDF::Model::TypeXref
            end
          end

          include ModelHelper

          attr_accessor :phenotype_list
          attr_accessor :x_ref_list

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_name
            __xmlattr[AttrName]
          end

          def xmlattr_name=(value)
            __xmlattr[AttrName] = value
          end

          def xmlattr_target_id
            __xmlattr[AttrTarget_id]
          end

          def xmlattr_target_id=(value)
            __xmlattr[AttrTarget_id] = value
          end

          def initialize(phenotype_list = nil, x_ref_list = nil)
            @phenotype_list = phenotype_list
            @x_ref_list = x_ref_list
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Name: SOAP::SOAPString,
              target_id: SOAP::SOAPInt
            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              phenotype_list: ClinVar::RDF::Model::PhenotypeListDetailsType,
              x_ref_list: ClinVar::RDF::Model::PharmaType::DrugResponse::XRefList
            }
          end
        end

        include ModelHelper

        def self.element_type
          ClinVar::RDF::Model::PharmaType::DrugResponse
        end
      end

      # {}typeMethodRefs
      #   method_name - SOAP::SOAPString
      #   x_ref - ClinVar::RDF::Model::TypeXref
      class TypeMethodRefs
        include ModelHelper

        attr_accessor :method_name
        attr_accessor :x_ref

        def initialize(method_name = nil, x_ref = [])
          @method_name = method_name
          @x_ref = x_ref
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {

          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            method_name: SOAP::SOAPString,
            x_ref: ClinVar::RDF::Model::TypeXref
          }
        end
      end

      # {}typeSample
      #   sample_description - ClinVar::RDF::Model::TypeSample::SampleDescription
      #   origin - SOAP::SOAPString
      #   ethnicity - SOAP::SOAPString
      #   geographic_origin - SOAP::SOAPString
      #   tissue - SOAP::SOAPString
      #   cell_line - SOAP::SOAPString
      #   species - ClinVar::RDF::Model::TypeSample::Species
      #   age - ClinVar::RDF::Model::TypeSample::Age
      #   strain - SOAP::SOAPString
      #   affected_status - SOAP::SOAPString
      #   number_tested - SOAP::SOAPInt
      #   number_males - SOAP::SOAPInt
      #   number_females - SOAP::SOAPInt
      #   number_chr_tested - SOAP::SOAPInt
      #   gender - SOAP::SOAPString
      #   family_data - ClinVar::RDF::Model::FamilyInfo
      #   proband - SOAP::SOAPString
      #   indication - ClinVar::RDF::Model::IndicationType
      #   citation - ClinVar::RDF::Model::TypeCitation
      #   x_ref - ClinVar::RDF::Model::TypeXref
      #   comment - ClinVar::RDF::Model::TypeComment
      #   source_type - SOAP::SOAPString
      class TypeSample

        # inner class for member: SampleDescription
        # {}SampleDescription
        #   description - ClinVar::RDF::Model::TypeComment
        #   citation - ClinVar::RDF::Model::TypeCitation
        class SampleDescription
          include ModelHelper

          attr_accessor :description
          attr_accessor :citation

          def initialize(description = nil, citation = nil)
            @description = description
            @citation = citation
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {

            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              description: ClinVar::RDF::Model::TypeComment,
              citation: ClinVar::RDF::Model::TypeCitation
            }
          end
        end

        # inner class for member: Species
        # {}Species
        #   xmlattr_taxonomy_id - SOAP::SOAPInt
        class Species < ::String
          AttrTaxonomyId = XSD::QName.new(nil, "TaxonomyId")

          include ModelHelper

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_taxonomy_id
            __xmlattr[AttrTaxonomyId]
          end

          def xmlattr_taxonomy_id=(value)
            __xmlattr[AttrTaxonomyId] = value
          end

          def initialize(*arg)
            super
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              TaxonomyId: SOAP::SOAPInt
            }
          end

          def element_mapping
            @__element_mapping__ ||= {

            }
          end
        end

        # inner class for member: Age
        # {}Age
        #   xmlattr_age_unit - SOAP::SOAPString
        #   xmlattr_type - SOAP::SOAPString
        class Age < ::String
          AttrAge_unit = XSD::QName.new(nil, "age_unit")
          AttrType = XSD::QName.new(nil, "Type")

          include ModelHelper

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_age_unit
            __xmlattr[AttrAge_unit]
          end

          def xmlattr_age_unit=(value)
            __xmlattr[AttrAge_unit] = value
          end

          def xmlattr_type
            __xmlattr[AttrType]
          end

          def xmlattr_type=(value)
            __xmlattr[AttrType] = value
          end

          def initialize(*arg)
            super
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              age_unit: SOAP::SOAPString,
              Type: SOAP::SOAPString
            }
          end

          def element_mapping
            @__element_mapping__ ||= {

            }
          end
        end

        include ModelHelper

        attr_accessor :sample_description
        attr_accessor :origin
        attr_accessor :ethnicity
        attr_accessor :geographic_origin
        attr_accessor :tissue
        attr_accessor :cell_line
        attr_accessor :species
        attr_accessor :age
        attr_accessor :strain
        attr_accessor :affected_status
        attr_accessor :number_tested
        attr_accessor :number_males
        attr_accessor :number_females
        attr_accessor :number_chr_tested
        attr_accessor :gender
        attr_accessor :family_data
        attr_accessor :proband
        attr_accessor :indication
        attr_accessor :citation
        attr_accessor :x_ref
        attr_accessor :comment
        attr_accessor :source_type

        def initialize(sample_description = nil, origin = nil, ethnicity = nil, geographic_origin = nil, tissue = nil, cell_line = nil, species = nil, age = [], strain = nil, affected_status = nil, number_tested = nil, number_males = nil, number_females = nil, number_chr_tested = nil, gender = nil, family_data = nil, proband = nil, indication = nil, citation = [], x_ref = [], comment = [], source_type = nil)
          @sample_description = sample_description
          @origin = origin
          @ethnicity = ethnicity
          @geographic_origin = geographic_origin
          @tissue = tissue
          @cell_line = cell_line
          @species = species
          @age = age
          @strain = strain
          @affected_status = affected_status
          @number_tested = number_tested
          @number_males = number_males
          @number_females = number_females
          @number_chr_tested = number_chr_tested
          @gender = gender
          @family_data = family_data
          @proband = proband
          @indication = indication
          @citation = citation
          @x_ref = x_ref
          @comment = comment
          @source_type = source_type
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {

          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            sample_description: ClinVar::RDF::Model::TypeSample::SampleDescription,
            origin: SOAP::SOAPString,
            ethnicity: SOAP::SOAPString,
            geographic_origin: SOAP::SOAPString,
            tissue: SOAP::SOAPString,
            cell_line: SOAP::SOAPString,
            species: ClinVar::RDF::Model::TypeSample::Species,
            age: ClinVar::RDF::Model::TypeSample::Age,
            strain: SOAP::SOAPString,
            affected_status: SOAP::SOAPString,
            number_tested: SOAP::SOAPInt,
            number_males: SOAP::SOAPInt,
            number_females: SOAP::SOAPInt,
            number_chr_tested: SOAP::SOAPInt,
            gender: SOAP::SOAPString,
            family_data: ClinVar::RDF::Model::FamilyInfo,
            proband: SOAP::SOAPString,
            indication: ClinVar::RDF::Model::IndicationType,
            citation: ClinVar::RDF::Model::TypeCitation,
            x_ref: ClinVar::RDF::Model::TypeXref,
            comment: ClinVar::RDF::Model::TypeComment,
            source_type: SOAP::SOAPString
          }
        end
      end

      # {}FamilyInfo
      #   family_history - SOAP::SOAPString
      #   xmlattr_num_families - SOAP::SOAPInt
      #   xmlattr_num_families_with_variant - SOAP::SOAPInt
      #   xmlattr_num_families_with_segregation_observed - SOAP::SOAPInt
      #   xmlattr_pedigree_id - SOAP::SOAPString
      #   xmlattr_segregation_observed - SOAP::SOAPString
      class FamilyInfo
        AttrNumFamilies = XSD::QName.new(nil, "NumFamilies")
        AttrNumFamiliesWithSegregationObserved = XSD::QName.new(nil, "NumFamiliesWithSegregationObserved")
        AttrNumFamiliesWithVariant = XSD::QName.new(nil, "NumFamiliesWithVariant")
        AttrPedigreeID = XSD::QName.new(nil, "PedigreeID")
        AttrSegregationObserved = XSD::QName.new(nil, "SegregationObserved")

        include ModelHelper

        attr_accessor :family_history

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_num_families
          __xmlattr[AttrNumFamilies]
        end

        def xmlattr_num_families=(value)
          __xmlattr[AttrNumFamilies] = value
        end

        def xmlattr_num_families_with_variant
          __xmlattr[AttrNumFamiliesWithVariant]
        end

        def xmlattr_num_families_with_variant=(value)
          __xmlattr[AttrNumFamiliesWithVariant] = value
        end

        def xmlattr_num_families_with_segregation_observed
          __xmlattr[AttrNumFamiliesWithSegregationObserved]
        end

        def xmlattr_num_families_with_segregation_observed=(value)
          __xmlattr[AttrNumFamiliesWithSegregationObserved] = value
        end

        def xmlattr_pedigree_id
          __xmlattr[AttrPedigreeID]
        end

        def xmlattr_pedigree_id=(value)
          __xmlattr[AttrPedigreeID] = value
        end

        def xmlattr_segregation_observed
          __xmlattr[AttrSegregationObserved]
        end

        def xmlattr_segregation_observed=(value)
          __xmlattr[AttrSegregationObserved] = value
        end

        def initialize(family_history = nil)
          @family_history = family_history
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            NumFamilies: SOAP::SOAPInt,
            NumFamiliesWithVariant: SOAP::SOAPInt,
            NumFamiliesWithSegregationObserved: SOAP::SOAPInt,
            PedigreeID: SOAP::SOAPString,
            SegregationObserved: SOAP::SOAPString
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            family_history: SOAP::SOAPString
          }
        end
      end

      # {}typeSoftwareSet
      #   xmlattr_name - SOAP::SOAPString
      #   xmlattr_version - SOAP::SOAPString
      #   xmlattr_purpose - SOAP::SOAPString
      class TypeSoftwareSet
        AttrName = XSD::QName.new(nil, "name")
        AttrPurpose = XSD::QName.new(nil, "purpose")
        AttrVersion = XSD::QName.new(nil, "version")

        include ModelHelper

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_name
          __xmlattr[AttrName]
        end

        def xmlattr_name=(value)
          __xmlattr[AttrName] = value
        end

        def xmlattr_version
          __xmlattr[AttrVersion]
        end

        def xmlattr_version=(value)
          __xmlattr[AttrVersion] = value
        end

        def xmlattr_purpose
          __xmlattr[AttrPurpose]
        end

        def xmlattr_purpose=(value)
          __xmlattr[AttrPurpose] = value
        end

        def initialize(*args)
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            name: SOAP::SOAPString,
            version: SOAP::SOAPString,
            purpose: SOAP::SOAPString
          }
        end

        def element_mapping
          @__element_mapping__ ||= {

          }
        end
      end

      # {}typeSingleInterpretation
      #   description - SOAP::SOAPString
      #   explanation - ClinVar::RDF::Model::TypeComment
      #   x_ref - ClinVar::RDF::Model::TypeXref
      #   citation - ClinVar::RDF::Model::TypeCitation
      #   comment - ClinVar::RDF::Model::TypeComment
      #   xmlattr_date_last_evaluated - SOAP::SOAPDate
      #   xmlattr_allele_origin - SOAP::SOAPString
      #   xmlattr_type - SOAP::SOAPString
      class TypeSingleInterpretation
        AttrAlleleOrigin = XSD::QName.new(nil, "AlleleOrigin")
        AttrDateLastEvaluated = XSD::QName.new(nil, "DateLastEvaluated")
        AttrType = XSD::QName.new(nil, "Type")

        include ModelHelper

        attr_accessor :description
        attr_accessor :explanation
        attr_accessor :x_ref
        attr_accessor :citation
        attr_accessor :comment

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_date_last_evaluated
          __xmlattr[AttrDateLastEvaluated]
        end

        def xmlattr_date_last_evaluated=(value)
          __xmlattr[AttrDateLastEvaluated] = value
        end

        def xmlattr_allele_origin
          __xmlattr[AttrAlleleOrigin]
        end

        def xmlattr_allele_origin=(value)
          __xmlattr[AttrAlleleOrigin] = value
        end

        def xmlattr_type
          __xmlattr[AttrType]
        end

        def xmlattr_type=(value)
          __xmlattr[AttrType] = value
        end

        def initialize(description = nil, explanation = nil, x_ref = [], citation = [], comment = [])
          @description = description
          @explanation = explanation
          @x_ref = x_ref
          @citation = citation
          @comment = comment
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            DateLastEvaluated: SOAP::SOAPDate,
            AlleleOrigin: SOAP::SOAPString,
            Type: SOAP::SOAPString
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            description: SOAP::SOAPString,
            explanation: ClinVar::RDF::Model::TypeComment,
            x_ref: ClinVar::RDF::Model::TypeXref,
            citation: ClinVar::RDF::Model::TypeCitation,
            comment: ClinVar::RDF::Model::TypeComment
          }
        end
      end

      # {}typeAggregatedInterpretation
      #   description - SOAP::SOAPString
      #   explanation - ClinVar::RDF::Model::TypeComment
      #   x_ref - ClinVar::RDF::Model::TypeXref
      #   citation - ClinVar::RDF::Model::TypeCitation
      #   comment - ClinVar::RDF::Model::TypeComment
      #   description_history - ClinVar::RDF::Model::TypeDescriptionHistory
      #   condition_list - ClinVar::RDF::Model::TypeAggregatedInterpretation::ConditionList
      #   xmlattr_date_last_evaluated - SOAP::SOAPDate
      #   xmlattr_allele_origin - SOAP::SOAPString
      #   xmlattr_type - SOAP::SOAPString
      #   xmlattr_number_of_submitters - SOAP::SOAPNonNegativeInteger
      #   xmlattr_number_of_submissions - SOAP::SOAPNonNegativeInteger
      class TypeAggregatedInterpretation < TypeSingleInterpretation
        AttrAlleleOrigin = XSD::QName.new(nil, "AlleleOrigin")
        AttrDateLastEvaluated = XSD::QName.new(nil, "DateLastEvaluated")
        AttrNumberOfSubmissions = XSD::QName.new(nil, "NumberOfSubmissions")
        AttrNumberOfSubmitters = XSD::QName.new(nil, "NumberOfSubmitters")
        AttrType = XSD::QName.new(nil, "Type")

        # inner class for member: ConditionList
        # {}ConditionList
        class ConditionList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::ClinAsserTraitSetType
          end
        end

        include ModelHelper

        attr_accessor :description
        attr_accessor :explanation
        attr_accessor :x_ref
        attr_accessor :citation
        attr_accessor :comment
        attr_accessor :description_history
        attr_accessor :condition_list

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_date_last_evaluated
          __xmlattr[AttrDateLastEvaluated]
        end

        def xmlattr_date_last_evaluated=(value)
          __xmlattr[AttrDateLastEvaluated] = value
        end

        def xmlattr_allele_origin
          __xmlattr[AttrAlleleOrigin]
        end

        def xmlattr_allele_origin=(value)
          __xmlattr[AttrAlleleOrigin] = value
        end

        def xmlattr_type
          __xmlattr[AttrType]
        end

        def xmlattr_type=(value)
          __xmlattr[AttrType] = value
        end

        def xmlattr_number_of_submitters
          __xmlattr[AttrNumberOfSubmitters]
        end

        def xmlattr_number_of_submitters=(value)
          __xmlattr[AttrNumberOfSubmitters] = value
        end

        def xmlattr_number_of_submissions
          __xmlattr[AttrNumberOfSubmissions]
        end

        def xmlattr_number_of_submissions=(value)
          __xmlattr[AttrNumberOfSubmissions] = value
        end

        def initialize(description = nil, explanation = nil, x_ref = [], citation = [], comment = [], description_history = [], condition_list = nil)
          @description = description
          @explanation = explanation
          @x_ref = x_ref
          @citation = citation
          @comment = comment
          @description_history = description_history
          @condition_list = condition_list
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            DateLastEvaluated: SOAP::SOAPDate,
            AlleleOrigin: SOAP::SOAPString,
            Type: SOAP::SOAPString,
            NumberOfSubmitters: SOAP::SOAPNonNegativeInteger,
            NumberOfSubmissions: SOAP::SOAPNonNegativeInteger
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            description: SOAP::SOAPString,
            explanation: ClinVar::RDF::Model::TypeComment,
            x_ref: ClinVar::RDF::Model::TypeXref,
            citation: ClinVar::RDF::Model::TypeCitation,
            comment: ClinVar::RDF::Model::TypeComment,
            description_history: ClinVar::RDF::Model::TypeDescriptionHistory,
            condition_list: ClinVar::RDF::Model::TypeAggregatedInterpretation::ConditionList
          }
        end
      end

      # {}typeAggregatedInterpretationSet
      class TypeAggregatedInterpretationSet < ::Array
        include ModelHelper

        def self.element_type
          ClinVar::RDF::Model::TypeAggregatedInterpretation
        end
      end

      # {}typeDescriptionHistory
      #   description - SOAP::SOAPString
      #   xmlattr_dated - SOAP::SOAPDate
      class TypeDescriptionHistory
        AttrDated = XSD::QName.new(nil, "Dated")

        include ModelHelper

        attr_accessor :description

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_dated
          __xmlattr[AttrDated]
        end

        def xmlattr_dated=(value)
          __xmlattr[AttrDated] = value
        end

        def initialize(description = nil)
          @description = description
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            Dated: SOAP::SOAPDate
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            description: SOAP::SOAPString
          }
        end
      end

      # {}typeRCV
      #   interpreted_condition_list - ClinVar::RDF::Model::TypeRCV::InterpretedConditionList
      #   replaced_list - ClinVar::RDF::Model::TypeRCV::ReplacedList
      #   xmlattr_title - SOAP::SOAPString
      #   xmlattr_date_last_evaluated - SOAP::SOAPDate
      #   xmlattr_interpretation - SOAP::SOAPString
      #   xmlattr_submission_count - SOAP::SOAPPositiveInteger
      #   xmlattr_review_status - SOAP::SOAPString
      #   xmlattr_accession - SOAP::SOAPString
      #   xmlattr_version - SOAP::SOAPInteger
      class TypeRCV
        AttrAccession = XSD::QName.new(nil, "Accession")
        AttrDateLastEvaluated = XSD::QName.new(nil, "DateLastEvaluated")
        AttrInterpretation = XSD::QName.new(nil, "Interpretation")
        AttrReviewStatus = XSD::QName.new(nil, "ReviewStatus")
        AttrSubmissionCount = XSD::QName.new(nil, "SubmissionCount")
        AttrTitle = XSD::QName.new(nil, "Title")
        AttrVersion = XSD::QName.new(nil, "Version")

        # inner class for member: InterpretedConditionList
        # {}InterpretedConditionList
        class InterpretedConditionList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeRCVInterpretedCondition
          end
        end

        # inner class for member: ReplacedList
        # {}ReplacedList
        class ReplacedList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeRecordHistory
          end
        end

        include ModelHelper

        attr_accessor :interpreted_condition_list
        attr_accessor :replaced_list

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_title
          __xmlattr[AttrTitle]
        end

        def xmlattr_title=(value)
          __xmlattr[AttrTitle] = value
        end

        def xmlattr_date_last_evaluated
          __xmlattr[AttrDateLastEvaluated]
        end

        def xmlattr_date_last_evaluated=(value)
          __xmlattr[AttrDateLastEvaluated] = value
        end

        def xmlattr_interpretation
          __xmlattr[AttrInterpretation]
        end

        def xmlattr_interpretation=(value)
          __xmlattr[AttrInterpretation] = value
        end

        def xmlattr_submission_count
          __xmlattr[AttrSubmissionCount]
        end

        def xmlattr_submission_count=(value)
          __xmlattr[AttrSubmissionCount] = value
        end

        def xmlattr_review_status
          __xmlattr[AttrReviewStatus]
        end

        def xmlattr_review_status=(value)
          __xmlattr[AttrReviewStatus] = value
        end

        def xmlattr_accession
          __xmlattr[AttrAccession]
        end

        def xmlattr_accession=(value)
          __xmlattr[AttrAccession] = value
        end

        def xmlattr_version
          __xmlattr[AttrVersion]
        end

        def xmlattr_version=(value)
          __xmlattr[AttrVersion] = value
        end

        def initialize(interpreted_condition_list = nil, replaced_list = nil)
          @interpreted_condition_list = interpreted_condition_list
          @replaced_list = replaced_list
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            Title: SOAP::SOAPString,
            DateLastEvaluated: SOAP::SOAPDate,
            Interpretation: SOAP::SOAPString,
            SubmissionCount: SOAP::SOAPPositiveInteger,
            ReviewStatus: SOAP::SOAPString,
            Accession: SOAP::SOAPString,
            Version: SOAP::SOAPInteger
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            interpreted_condition_list: ClinVar::RDF::Model::TypeRCV::InterpretedConditionList,
            replaced_list: ClinVar::RDF::Model::TypeRCV::ReplacedList
          }
        end
      end

      # {}typeSCV
      #   xmlattr_title - SOAP::SOAPString
      #   xmlattr_accession - SOAP::SOAPString
      #   xmlattr_version - SOAP::SOAPInteger
      class TypeSCV
        AttrAccession = XSD::QName.new(nil, "Accession")
        AttrTitle = XSD::QName.new(nil, "Title")
        AttrVersion = XSD::QName.new(nil, "Version")

        include ModelHelper

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_title
          __xmlattr[AttrTitle]
        end

        def xmlattr_title=(value)
          __xmlattr[AttrTitle] = value
        end

        def xmlattr_accession
          __xmlattr[AttrAccession]
        end

        def xmlattr_accession=(value)
          __xmlattr[AttrAccession] = value
        end

        def xmlattr_version
          __xmlattr[AttrVersion]
        end

        def xmlattr_version=(value)
          __xmlattr[AttrVersion] = value
        end

        def initialize(*args)
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            Title: SOAP::SOAPString,
            Accession: SOAP::SOAPString,
            Version: SOAP::SOAPInteger
          }
        end

        def element_mapping
          @__element_mapping__ ||= {

          }
        end
      end

      # {}typeFunctionalConsequence
      #   x_ref - ClinVar::RDF::Model::TypeXref
      #   citation - ClinVar::RDF::Model::TypeCitation
      #   comment - ClinVar::RDF::Model::TypeComment
      #   xmlattr_value - SOAP::SOAPString
      class TypeFunctionalConsequence
        AttrValue = XSD::QName.new(nil, "Value")

        include ModelHelper

        attr_accessor :x_ref
        attr_accessor :citation
        attr_accessor :comment

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_value
          __xmlattr[AttrValue]
        end

        def xmlattr_value=(value)
          __xmlattr[AttrValue] = value
        end

        def initialize(x_ref = [], citation = [], comment = [])
          @x_ref = x_ref
          @citation = citation
          @comment = comment
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            Value: SOAP::SOAPString
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            x_ref: ClinVar::RDF::Model::TypeXref,
            citation: ClinVar::RDF::Model::TypeCitation,
            comment: ClinVar::RDF::Model::TypeComment
          }
        end
      end

      # {}VariationArchiveType
      #   record_status - SOAP::SOAPString
      #   replaced_by - ClinVar::RDF::Model::TypeRecordHistory
      #   replaced_list - ClinVar::RDF::Model::VariationArchiveType::ReplacedList
      #   comment - ClinVar::RDF::Model::TypeComment
      #   species - ClinVar::RDF::Model::VariationArchiveType::Species
      #   interpreted_record - ClinVar::RDF::Model::InterpretedRecord
      #   included_record - ClinVar::RDF::Model::IncludedRecord
      #   xmlattr_variation_id - SOAP::SOAPPositiveInteger
      #   xmlattr_variation_name - SOAP::SOAPString
      #   xmlattr_variation_type - SOAP::SOAPString
      #   xmlattr_date_created - SOAP::SOAPDate
      #   xmlattr_date_last_updated - SOAP::SOAPDate
      #   xmlattr_accession - SOAP::SOAPString
      #   xmlattr_version - SOAP::SOAPInt
      #   xmlattr_number_of_submitters - SOAP::SOAPNonNegativeInteger
      #   xmlattr_number_of_submissions - SOAP::SOAPNonNegativeInteger
      #   xmlattr_record_type - SOAP::SOAPString
      class VariationArchiveType
        AttrAccession = XSD::QName.new(nil, "Accession")
        AttrDateCreated = XSD::QName.new(nil, "DateCreated")
        AttrDateLastUpdated = XSD::QName.new(nil, "DateLastUpdated")
        AttrNumberOfSubmissions = XSD::QName.new(nil, "NumberOfSubmissions")
        AttrNumberOfSubmitters = XSD::QName.new(nil, "NumberOfSubmitters")
        AttrRecordType = XSD::QName.new(nil, "RecordType")
        AttrVariationID = XSD::QName.new(nil, "VariationID")
        AttrVariationName = XSD::QName.new(nil, "VariationName")
        AttrVariationType = XSD::QName.new(nil, "VariationType")
        AttrVersion = XSD::QName.new(nil, "Version")

        # inner class for member: ReplacedList
        # {}ReplacedList
        class ReplacedList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeRecordHistory
          end
        end

        # inner class for member: Species
        # {}Species
        #   xmlattr_taxonomy_id - SOAP::SOAPInt
        class Species < ::String
          AttrTaxonomyId = XSD::QName.new(nil, "TaxonomyId")

          include ModelHelper

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_taxonomy_id
            __xmlattr[AttrTaxonomyId]
          end

          def xmlattr_taxonomy_id=(value)
            __xmlattr[AttrTaxonomyId] = value
          end

          def initialize(*arg)
            super
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              TaxonomyId: SOAP::SOAPInt
            }
          end

          def element_mapping
            @__element_mapping__ ||= {

            }
          end
        end

        include ModelHelper

        attr_accessor :record_status
        attr_accessor :replaced_by
        attr_accessor :replaced_list
        attr_accessor :comment
        attr_accessor :species
        attr_accessor :interpreted_record
        attr_accessor :included_record

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_variation_id
          __xmlattr[AttrVariationID]
        end

        def xmlattr_variation_id=(value)
          __xmlattr[AttrVariationID] = value
        end

        def xmlattr_variation_name
          __xmlattr[AttrVariationName]
        end

        def xmlattr_variation_name=(value)
          __xmlattr[AttrVariationName] = value
        end

        def xmlattr_variation_type
          __xmlattr[AttrVariationType]
        end

        def xmlattr_variation_type=(value)
          __xmlattr[AttrVariationType] = value
        end

        def xmlattr_date_created
          __xmlattr[AttrDateCreated]
        end

        def xmlattr_date_created=(value)
          __xmlattr[AttrDateCreated] = value
        end

        def xmlattr_date_last_updated
          __xmlattr[AttrDateLastUpdated]
        end

        def xmlattr_date_last_updated=(value)
          __xmlattr[AttrDateLastUpdated] = value
        end

        def xmlattr_accession
          __xmlattr[AttrAccession]
        end

        def xmlattr_accession=(value)
          __xmlattr[AttrAccession] = value
        end

        def xmlattr_version
          __xmlattr[AttrVersion]
        end

        def xmlattr_version=(value)
          __xmlattr[AttrVersion] = value
        end

        def xmlattr_number_of_submitters
          __xmlattr[AttrNumberOfSubmitters]
        end

        def xmlattr_number_of_submitters=(value)
          __xmlattr[AttrNumberOfSubmitters] = value
        end

        def xmlattr_number_of_submissions
          __xmlattr[AttrNumberOfSubmissions]
        end

        def xmlattr_number_of_submissions=(value)
          __xmlattr[AttrNumberOfSubmissions] = value
        end

        def xmlattr_record_type
          __xmlattr[AttrRecordType]
        end

        def xmlattr_record_type=(value)
          __xmlattr[AttrRecordType] = value
        end

        def initialize(record_status = nil, replaced_by = nil, replaced_list = nil, comment = nil, species = nil, interpreted_record = nil, included_record = nil)
          @record_status = record_status
          @replaced_by = replaced_by
          @replaced_list = replaced_list
          @comment = comment
          @species = species
          @interpreted_record = interpreted_record
          @included_record = included_record
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            VariationID: SOAP::SOAPPositiveInteger,
            VariationName: SOAP::SOAPString,
            VariationType: SOAP::SOAPString,
            DateCreated: SOAP::SOAPDate,
            DateLastUpdated: SOAP::SOAPDate,
            Accession: SOAP::SOAPString,
            Version: SOAP::SOAPInt,
            NumberOfSubmitters: SOAP::SOAPNonNegativeInteger,
            NumberOfSubmissions: SOAP::SOAPNonNegativeInteger,
            RecordType: SOAP::SOAPString
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            record_status: SOAP::SOAPString,
            replaced_by: ClinVar::RDF::Model::TypeRecordHistory,
            replaced_list: ClinVar::RDF::Model::VariationArchiveType::ReplacedList,
            comment: ClinVar::RDF::Model::TypeComment,
            species: ClinVar::RDF::Model::VariationArchiveType::Species,
            interpreted_record: ClinVar::RDF::Model::InterpretedRecord,
            included_record: ClinVar::RDF::Model::IncludedRecord
          }
        end
      end

      # {}ReleaseType
      #   variation_archive - ClinVar::RDF::Model::VariationArchiveType
      #   xmlattr_release_date - SOAP::SOAPDate
      class ReleaseType
        AttrReleaseDate = XSD::QName.new(nil, "ReleaseDate")

        include ModelHelper

        attr_accessor :variation_archive

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_release_date
          __xmlattr[AttrReleaseDate]
        end

        def xmlattr_release_date=(value)
          __xmlattr[AttrReleaseDate] = value
        end

        def initialize(variation_archive = [])
          @variation_archive = variation_archive
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            ReleaseDate: SOAP::SOAPDate
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            variation_archive: ClinVar::RDF::Model::VariationArchiveType
          }
        end
      end

      # {}Co-occurrenceType
      #   zygosity - ClinVar::RDF::Model::TypeZygosity
      #   allele_desc_set - ClinVar::RDF::Model::TypeAlleleDescr
      #   count - SOAP::SOAPInt
      class CoOccurrenceType
        include ModelHelper

        attr_accessor :zygosity
        attr_accessor :allele_desc_set
        attr_accessor :count

        def initialize(zygosity = nil, allele_desc_set = [], count = nil)
          @zygosity = zygosity
          @allele_desc_set = allele_desc_set
          @count = count
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {

          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            zygosity: ClinVar::RDF::Model::TypeZygosity,
            allele_desc_set: ClinVar::RDF::Model::TypeAlleleDescr,
            count: SOAP::SOAPInt
          }
        end
      end

      # {}typeDeletedSCV
      #   accession - ClinVar::RDF::Model::TypeDeletedSCV::Accession
      #   description - SOAP::SOAPString
      class TypeDeletedSCV

        # inner class for member: Accession
        # {}Accession
        #   xmlattr_version - SOAP::SOAPNonNegativeInteger
        #   xmlattr_date_deleted - SOAP::SOAPDate
        class Accession < ::String
          AttrDateDeleted = XSD::QName.new(nil, "DateDeleted")
          AttrVersion = XSD::QName.new(nil, "Version")

          include ModelHelper

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_version
            __xmlattr[AttrVersion]
          end

          def xmlattr_version=(value)
            __xmlattr[AttrVersion] = value
          end

          def xmlattr_date_deleted
            __xmlattr[AttrDateDeleted]
          end

          def xmlattr_date_deleted=(value)
            __xmlattr[AttrDateDeleted] = value
          end

          def initialize(*arg)
            super
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Version: SOAP::SOAPNonNegativeInteger,
              DateDeleted: SOAP::SOAPDate
            }
          end

          def element_mapping
            @__element_mapping__ ||= {

            }
          end
        end

        include ModelHelper

        attr_accessor :accession
        attr_accessor :description

        def initialize(accession = nil, description = nil)
          @accession = accession
          @description = description
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {

          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            accession: ClinVar::RDF::Model::TypeDeletedSCV::Accession,
            description: SOAP::SOAPString
          }
        end
      end

      # {}MeasureTraitType
      #   clin_var_submission_id - ClinVar::RDF::Model::MeasureTraitType::ClinVarSubmissionID
      #   clin_var_accession - ClinVar::RDF::Model::MeasureTraitType::ClinVarAccession
      #   additional_submitters - ClinVar::RDF::Model::MeasureTraitType::AdditionalSubmitters
      #   record_status - SOAP::SOAPString
      #   replaces - SOAP::SOAPString
      #   replaced_list - ClinVar::RDF::Model::MeasureTraitType::ReplacedList
      #   review_status - ClinVar::RDF::Model::TypeSubmitterReviewStatusValue
      #   interpretation - ClinVar::RDF::Model::TypeSingleInterpretation
      #   custom_assertion_score - ClinVar::RDF::Model::MeasureTraitType::CustomAssertionScore
      #   assertion - ClinVar::RDF::Model::TypeAssertionTypeAttr
      #   attribute_set - ClinVar::RDF::Model::MeasureTraitType::AttributeSet
      #   observed_in_list - ClinVar::RDF::Model::MeasureTraitType::ObservedInList
      #   simple_allele - ClinVar::RDF::Model::TypeAlleleSCV
      #   haplotype - ClinVar::RDF::Model::TypeHaplotypeSCV
      #   genotype - ClinVar::RDF::Model::TypeGenotypeSCV
      #   trait_set - ClinVar::RDF::Model::ClinAsserTraitSetType
      #   citation - ClinVar::RDF::Model::TypeCitation
      #   study_name - SOAP::SOAPString
      #   study_description - SOAP::SOAPString
      #   comment - ClinVar::RDF::Model::TypeComment
      #   submission_name_list - ClinVar::RDF::Model::MeasureTraitType::SubmissionNameList
      #   xmlattr_date_created - SOAP::SOAPDate
      #   xmlattr_date_last_updated - SOAP::SOAPDate
      #   xmlattr_submission_date - SOAP::SOAPDate
      #   xmlattr_id - SOAP::SOAPPositiveInteger
      class MeasureTraitType
        AttrDateCreated = XSD::QName.new(nil, "DateCreated")
        AttrDateLastUpdated = XSD::QName.new(nil, "DateLastUpdated")
        AttrID = XSD::QName.new(nil, "ID")
        AttrSubmissionDate = XSD::QName.new(nil, "SubmissionDate")

        # inner class for member: ClinVarSubmissionID
        # {}ClinVarSubmissionID
        #   xmlattr_local_key - SOAP::SOAPString
        #   xmlattr_title - SOAP::SOAPString
        #   xmlattr_local_key_is_submitted - (any)
        #   xmlattr_submitted_assembly - SOAP::SOAPString
        class ClinVarSubmissionID
          AttrLocalKey = XSD::QName.new(nil, "localKey")
          AttrLocalKeyIsSubmitted = XSD::QName.new(nil, "localKeyIsSubmitted")
          AttrSubmittedAssembly = XSD::QName.new(nil, "submittedAssembly")
          AttrTitle = XSD::QName.new(nil, "title")

          include ModelHelper

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_local_key
            __xmlattr[AttrLocalKey]
          end

          def xmlattr_local_key=(value)
            __xmlattr[AttrLocalKey] = value
          end

          def xmlattr_title
            __xmlattr[AttrTitle]
          end

          def xmlattr_title=(value)
            __xmlattr[AttrTitle] = value
          end

          def xmlattr_local_key_is_submitted
            __xmlattr[AttrLocalKeyIsSubmitted]
          end

          def xmlattr_local_key_is_submitted=(value)
            __xmlattr[AttrLocalKeyIsSubmitted] = value
          end

          def xmlattr_submitted_assembly
            __xmlattr[AttrSubmittedAssembly]
          end

          def xmlattr_submitted_assembly=(value)
            __xmlattr[AttrSubmittedAssembly] = value
          end

          def initialize(*args)
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              localKey: SOAP::SOAPString,
              title: SOAP::SOAPString,
              localKeyIsSubmitted: String,
              submittedAssembly: SOAP::SOAPString
            }
          end

          def element_mapping
            @__element_mapping__ ||= {

            }
          end
        end

        # inner class for member: ClinVarAccession
        # {}ClinVarAccession
        #   xmlattr_accession - SOAP::SOAPString
        #   xmlattr_version - SOAP::SOAPInteger
        #   xmlattr_type - SOAP::SOAPString
        #   xmlattr_submitter_name - SOAP::SOAPString
        #   xmlattr_org_id - SOAP::SOAPPositiveInteger
        #   xmlattr_organization_category - SOAP::SOAPString
        #   xmlattr_org_abbreviation - SOAP::SOAPString
        #   xmlattr_date_updated - SOAP::SOAPDate
        class ClinVarAccession
          AttrAccession = XSD::QName.new(nil, "Accession")
          AttrDateUpdated = XSD::QName.new(nil, "DateUpdated")
          AttrOrgAbbreviation = XSD::QName.new(nil, "OrgAbbreviation")
          AttrOrgID = XSD::QName.new(nil, "OrgID")
          AttrOrganizationCategory = XSD::QName.new(nil, "OrganizationCategory")
          AttrSubmitterName = XSD::QName.new(nil, "SubmitterName")
          AttrType = XSD::QName.new(nil, "Type")
          AttrVersion = XSD::QName.new(nil, "Version")

          include ModelHelper

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_accession
            __xmlattr[AttrAccession]
          end

          def xmlattr_accession=(value)
            __xmlattr[AttrAccession] = value
          end

          def xmlattr_version
            __xmlattr[AttrVersion]
          end

          def xmlattr_version=(value)
            __xmlattr[AttrVersion] = value
          end

          def xmlattr_type
            __xmlattr[AttrType]
          end

          def xmlattr_type=(value)
            __xmlattr[AttrType] = value
          end

          def xmlattr_submitter_name
            __xmlattr[AttrSubmitterName]
          end

          def xmlattr_submitter_name=(value)
            __xmlattr[AttrSubmitterName] = value
          end

          def xmlattr_org_id
            __xmlattr[AttrOrgID]
          end

          def xmlattr_org_id=(value)
            __xmlattr[AttrOrgID] = value
          end

          def xmlattr_organization_category
            __xmlattr[AttrOrganizationCategory]
          end

          def xmlattr_organization_category=(value)
            __xmlattr[AttrOrganizationCategory] = value
          end

          def xmlattr_org_abbreviation
            __xmlattr[AttrOrgAbbreviation]
          end

          def xmlattr_org_abbreviation=(value)
            __xmlattr[AttrOrgAbbreviation] = value
          end

          def xmlattr_date_updated
            __xmlattr[AttrDateUpdated]
          end

          def xmlattr_date_updated=(value)
            __xmlattr[AttrDateUpdated] = value
          end

          def initialize(*args)
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Accession: SOAP::SOAPString,
              Version: SOAP::SOAPInteger,
              Type: SOAP::SOAPString,
              SubmitterName: SOAP::SOAPString,
              OrgID: SOAP::SOAPPositiveInteger,
              OrganizationCategory: SOAP::SOAPString,
              OrgAbbreviation: SOAP::SOAPString,
              DateUpdated: SOAP::SOAPDate
            }
          end

          def element_mapping
            @__element_mapping__ ||= {

            }
          end
        end

        # inner class for member: AdditionalSubmitters
        # {}AdditionalSubmitters
        class AdditionalSubmitters < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::SubmitterType
          end
        end

        # inner class for member: ReplacedList
        # {}ReplacedList
        class ReplacedList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeRecordHistory
          end
        end

        # inner class for member: CustomAssertionScore
        # {}CustomAssertionScore
        #   citation - ClinVar::RDF::Model::TypeCitation
        #   x_ref - ClinVar::RDF::Model::TypeXref
        #   xmlattr_type - SOAP::SOAPString
        #   xmlattr_value - SOAP::SOAPString
        class CustomAssertionScore
          AttrType = XSD::QName.new(nil, "Type")
          AttrValue = XSD::QName.new(nil, "Value")

          include ModelHelper

          attr_accessor :citation
          attr_accessor :x_ref

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_type
            __xmlattr[AttrType]
          end

          def xmlattr_type=(value)
            __xmlattr[AttrType] = value
          end

          def xmlattr_value
            __xmlattr[AttrValue]
          end

          def xmlattr_value=(value)
            __xmlattr[AttrValue] = value
          end

          def initialize(citation = [], x_ref = [])
            @citation = citation
            @x_ref = x_ref
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Type: SOAP::SOAPString,
              Value: SOAP::SOAPString
            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              citation: ClinVar::RDF::Model::TypeCitation,
              x_ref: ClinVar::RDF::Model::TypeXref
            }
          end
        end

        # inner class for member: AttributeSet
        # {}AttributeSet
        #   attribute - ClinVar::RDF::Model::MeasureTraitType::AttributeSet::Attribute
        #   citation - ClinVar::RDF::Model::TypeCitation
        #   x_ref - ClinVar::RDF::Model::TypeXref
        #   comment - ClinVar::RDF::Model::TypeComment
        class AttributeSet

          # inner class for member: Attribute
          # {}Attribute
          #   xmlattr_type - SOAP::SOAPString
          class Attribute < ::String
            AttrType = XSD::QName.new(nil, "Type")

            include ModelHelper

            def __xmlattr
              @__xmlattr ||= {}
            end

            def xmlattr_type
              __xmlattr[AttrType]
            end

            def xmlattr_type=(value)
              __xmlattr[AttrType] = value
            end

            def initialize(*arg)
              super
              @__xmlattr = {}
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {
                Type: SOAP::SOAPString
              }
            end

            def element_mapping
              @__element_mapping__ ||= {

              }
            end
          end

          include ModelHelper

          attr_accessor :attribute
          attr_accessor :citation
          attr_accessor :x_ref
          attr_accessor :comment

          def initialize(attribute = nil, citation = [], x_ref = [], comment = [])
            @attribute = attribute
            @citation = citation
            @x_ref = x_ref
            @comment = comment
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {

            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              attribute: ClinVar::RDF::Model::MeasureTraitType::AttributeSet::Attribute,
              citation: ClinVar::RDF::Model::TypeCitation,
              x_ref: ClinVar::RDF::Model::TypeXref,
              comment: ClinVar::RDF::Model::TypeComment
            }
          end
        end

        # inner class for member: ObservedInList
        # {}ObservedInList
        class ObservedInList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::ObservationSet
          end
        end

        # inner class for member: SubmissionNameList
        # {}SubmissionNameList
        class SubmissionNameList < ::Array
          include ModelHelper

          def self.element_type
            (any)
          end
        end

        include ModelHelper

        attr_accessor :clin_var_submission_id
        attr_accessor :clin_var_accession
        attr_accessor :additional_submitters
        attr_accessor :record_status
        attr_accessor :replaces
        attr_accessor :replaced_list
        attr_accessor :review_status
        attr_accessor :interpretation
        attr_accessor :custom_assertion_score
        attr_accessor :assertion
        attr_accessor :attribute_set
        attr_accessor :observed_in_list
        attr_accessor :simple_allele
        attr_accessor :haplotype
        attr_accessor :genotype
        attr_accessor :trait_set
        attr_accessor :citation
        attr_accessor :study_name
        attr_accessor :study_description
        attr_accessor :comment
        attr_accessor :submission_name_list

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_date_created
          __xmlattr[AttrDateCreated]
        end

        def xmlattr_date_created=(value)
          __xmlattr[AttrDateCreated] = value
        end

        def xmlattr_date_last_updated
          __xmlattr[AttrDateLastUpdated]
        end

        def xmlattr_date_last_updated=(value)
          __xmlattr[AttrDateLastUpdated] = value
        end

        def xmlattr_submission_date
          __xmlattr[AttrSubmissionDate]
        end

        def xmlattr_submission_date=(value)
          __xmlattr[AttrSubmissionDate] = value
        end

        def xmlattr_id
          __xmlattr[AttrID]
        end

        def xmlattr_id=(value)
          __xmlattr[AttrID] = value
        end

        def initialize(clin_var_submission_id = nil, clin_var_accession = nil, additional_submitters = nil, record_status = nil, replaces = [], replaced_list = nil, review_status = nil, interpretation = nil, custom_assertion_score = [], assertion = nil, attribute_set = [], observed_in_list = nil, simple_allele = nil, haplotype = nil, genotype = nil, trait_set = nil, citation = [], study_name = nil, study_description = nil, comment = [], submission_name_list = nil)
          @clin_var_submission_id = clin_var_submission_id
          @clin_var_accession = clin_var_accession
          @additional_submitters = additional_submitters
          @record_status = record_status
          @replaces = replaces
          @replaced_list = replaced_list
          @review_status = review_status
          @interpretation = interpretation
          @custom_assertion_score = custom_assertion_score
          @assertion = assertion
          @attribute_set = attribute_set
          @observed_in_list = observed_in_list
          @simple_allele = simple_allele
          @haplotype = haplotype
          @genotype = genotype
          @trait_set = trait_set
          @citation = citation
          @study_name = study_name
          @study_description = study_description
          @comment = comment
          @submission_name_list = submission_name_list
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            DateCreated: SOAP::SOAPDate,
            DateLastUpdated: SOAP::SOAPDate,
            SubmissionDate: SOAP::SOAPDate,
            ID: SOAP::SOAPPositiveInteger
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            clin_var_submission_id: ClinVar::RDF::Model::MeasureTraitType::ClinVarSubmissionID,
            clin_var_accession: ClinVar::RDF::Model::MeasureTraitType::ClinVarAccession,
            additional_submitters: ClinVar::RDF::Model::MeasureTraitType::AdditionalSubmitters,
            record_status: SOAP::SOAPString,
            replaces: SOAP::SOAPString,
            replaced_list: ClinVar::RDF::Model::MeasureTraitType::ReplacedList,
            review_status: ClinVar::RDF::Model::TypeSubmitterReviewStatusValue,
            interpretation: ClinVar::RDF::Model::TypeSingleInterpretation,
            custom_assertion_score: ClinVar::RDF::Model::MeasureTraitType::CustomAssertionScore,
            assertion: ClinVar::RDF::Model::TypeAssertionTypeAttr,
            attribute_set: ClinVar::RDF::Model::MeasureTraitType::AttributeSet,
            observed_in_list: ClinVar::RDF::Model::MeasureTraitType::ObservedInList,
            simple_allele: ClinVar::RDF::Model::TypeAlleleSCV,
            haplotype: ClinVar::RDF::Model::TypeHaplotypeSCV,
            genotype: ClinVar::RDF::Model::TypeGenotypeSCV,
            trait_set: ClinVar::RDF::Model::ClinAsserTraitSetType,
            citation: ClinVar::RDF::Model::TypeCitation,
            study_name: SOAP::SOAPString,
            study_description: SOAP::SOAPString,
            comment: ClinVar::RDF::Model::TypeComment,
            submission_name_list: ClinVar::RDF::Model::MeasureTraitType::SubmissionNameList
          }
        end
      end

      # {}MethodType
      #   name_platform - SOAP::SOAPString
      #   type_platform - SOAP::SOAPString
      #   purpose - SOAP::SOAPString
      #   result_type - SOAP::SOAPString
      #   min_reported - SOAP::SOAPString
      #   max_reported - SOAP::SOAPString
      #   reference_standard - SOAP::SOAPString
      #   citation - ClinVar::RDF::Model::TypeCitation
      #   x_ref - ClinVar::RDF::Model::TypeXref
      #   description - SOAP::SOAPString
      #   software - ClinVar::RDF::Model::TypeSoftwareSet
      #   source_type - SOAP::SOAPString
      #   method_type - ClinVar::RDF::Model::TypeMethodlist
      #   method_attribute - ClinVar::RDF::Model::MethodType::MethodAttribute
      #   obs_method_attribute - ClinVar::RDF::Model::MethodType::ObsMethodAttribute
      class MethodType

        # inner class for member: MethodAttribute
        # {}MethodAttribute
        #   attribute - ClinVar::RDF::Model::MethodType::MethodAttribute::Attribute
        class MethodAttribute

          # inner class for member: Attribute
          # {}Attribute
          #   xmlattr_type - SOAP::SOAPString
          class Attribute < ::String
            AttrType = XSD::QName.new(nil, "Type")

            include ModelHelper

            def __xmlattr
              @__xmlattr ||= {}
            end

            def xmlattr_type
              __xmlattr[AttrType]
            end

            def xmlattr_type=(value)
              __xmlattr[AttrType] = value
            end

            def initialize(*arg)
              super
              @__xmlattr = {}
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {
                Type: SOAP::SOAPString
              }
            end

            def element_mapping
              @__element_mapping__ ||= {

              }
            end
          end

          include ModelHelper

          attr_accessor :attribute

          def initialize(attribute = nil)
            @attribute = attribute
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {

            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              attribute: ClinVar::RDF::Model::MethodType::MethodAttribute::Attribute
            }
          end
        end

        # inner class for member: ObsMethodAttribute
        # {}ObsMethodAttribute
        #   attribute - ClinVar::RDF::Model::MethodType::ObsMethodAttribute::Attribute
        #   comment - ClinVar::RDF::Model::TypeComment
        class ObsMethodAttribute

          # inner class for member: Attribute
          # {}Attribute
          #   xmlattr_type - SOAP::SOAPString
          class Attribute < ::String
            AttrType = XSD::QName.new(nil, "Type")

            include ModelHelper

            def __xmlattr
              @__xmlattr ||= {}
            end

            def xmlattr_type
              __xmlattr[AttrType]
            end

            def xmlattr_type=(value)
              __xmlattr[AttrType] = value
            end

            def initialize(*arg)
              super
              @__xmlattr = {}
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {
                Type: SOAP::SOAPString
              }
            end

            def element_mapping
              @__element_mapping__ ||= {

              }
            end
          end

          include ModelHelper

          attr_accessor :attribute
          attr_accessor :comment

          def initialize(attribute = nil, comment = [])
            @attribute = attribute
            @comment = comment
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {

            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              attribute: ClinVar::RDF::Model::MethodType::ObsMethodAttribute::Attribute,
              comment: ClinVar::RDF::Model::TypeComment
            }
          end
        end

        include ModelHelper

        attr_accessor :name_platform
        attr_accessor :type_platform
        attr_accessor :purpose
        attr_accessor :result_type
        attr_accessor :min_reported
        attr_accessor :max_reported
        attr_accessor :reference_standard
        attr_accessor :citation
        attr_accessor :x_ref
        attr_accessor :description
        attr_accessor :software
        attr_accessor :source_type
        attr_accessor :method_type
        attr_accessor :method_attribute
        attr_accessor :obs_method_attribute

        def initialize(name_platform = nil, type_platform = nil, purpose = nil, result_type = nil, min_reported = nil, max_reported = nil, reference_standard = nil, citation = [], x_ref = [], description = nil, software = [], source_type = nil, method_type = nil, method_attribute = [], obs_method_attribute = [])
          @name_platform = name_platform
          @type_platform = type_platform
          @purpose = purpose
          @result_type = result_type
          @min_reported = min_reported
          @max_reported = max_reported
          @reference_standard = reference_standard
          @citation = citation
          @x_ref = x_ref
          @description = description
          @software = software
          @source_type = source_type
          @method_type = method_type
          @method_attribute = method_attribute
          @obs_method_attribute = obs_method_attribute
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {

          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            name_platform: SOAP::SOAPString,
            type_platform: SOAP::SOAPString,
            purpose: SOAP::SOAPString,
            result_type: SOAP::SOAPString,
            min_reported: SOAP::SOAPString,
            max_reported: SOAP::SOAPString,
            reference_standard: SOAP::SOAPString,
            citation: ClinVar::RDF::Model::TypeCitation,
            x_ref: ClinVar::RDF::Model::TypeXref,
            description: SOAP::SOAPString,
            software: ClinVar::RDF::Model::TypeSoftwareSet,
            source_type: SOAP::SOAPString,
            method_type: ClinVar::RDF::Model::TypeMethodlist,
            method_attribute: ClinVar::RDF::Model::MethodType::MethodAttribute,
            obs_method_attribute: ClinVar::RDF::Model::MethodType::ObsMethodAttribute
          }
        end
      end

      # {}ObservationSet
      #   sample - ClinVar::RDF::Model::TypeSample
      #   method - ClinVar::RDF::Model::ObservationSet::C_Method
      #   observed_data - ClinVar::RDF::Model::ObservationSet::ObservedData
      #   co_occurrence_set - ClinVar::RDF::Model::CoOccurrenceType
      #   trait_set - ClinVar::RDF::Model::ClinAsserTraitSetType
      #   citation - ClinVar::RDF::Model::TypeCitation
      #   x_ref - ClinVar::RDF::Model::TypeXref
      #   comment - ClinVar::RDF::Model::TypeComment
      class ObservationSet

        # inner class for member: Method
        # {}Method
        #   name_platform - SOAP::SOAPString
        #   type_platform - SOAP::SOAPString
        #   purpose - SOAP::SOAPString
        #   result_type - SOAP::SOAPString
        #   min_reported - SOAP::SOAPString
        #   max_reported - SOAP::SOAPString
        #   reference_standard - SOAP::SOAPString
        #   citation - ClinVar::RDF::Model::TypeCitation
        #   x_ref - ClinVar::RDF::Model::TypeXref
        #   description - SOAP::SOAPString
        #   software - ClinVar::RDF::Model::TypeSoftwareSet
        #   source_type - SOAP::SOAPString
        #   method_type - ClinVar::RDF::Model::TypeMethodlist
        #   method_attribute - ClinVar::RDF::Model::ObservationSet::C_Method::MethodAttribute
        #   obs_method_attribute - ClinVar::RDF::Model::ObservationSet::C_Method::ObsMethodAttribute
        #   type - SOAP::SOAPString
        class C_Method < MethodType

          # inner class for member: MethodAttribute
          # {}MethodAttribute
          #   attribute - ClinVar::RDF::Model::ObservationSet::C_Method::MethodAttribute::Attribute
          class MethodAttribute

            # inner class for member: Attribute
            # {}Attribute
            #   xmlattr_type - SOAP::SOAPString
            class Attribute < ::String
              AttrType = XSD::QName.new(nil, "Type")

              include ModelHelper

              def __xmlattr
                @__xmlattr ||= {}
              end

              def xmlattr_type
                __xmlattr[AttrType]
              end

              def xmlattr_type=(value)
                __xmlattr[AttrType] = value
              end

              def initialize(*arg)
                super
                @__xmlattr = {}
              end

              def attribute_mapping
                @__attribute_mapping__ ||= {
                  Type: SOAP::SOAPString
                }
              end

              def element_mapping
                @__element_mapping__ ||= {

                }
              end
            end

            include ModelHelper

            attr_accessor :attribute

            def initialize(attribute = nil)
              @attribute = attribute
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {

              }
            end

            def element_mapping
              @__element_mapping__ ||= {
                attribute: ClinVar::RDF::Model::ObservationSet::C_Method::MethodAttribute::Attribute
              }
            end
          end

          # inner class for member: ObsMethodAttribute
          # {}ObsMethodAttribute
          #   attribute - ClinVar::RDF::Model::ObservationSet::C_Method::ObsMethodAttribute::Attribute
          #   comment - ClinVar::RDF::Model::TypeComment
          class ObsMethodAttribute

            # inner class for member: Attribute
            # {}Attribute
            #   xmlattr_type - SOAP::SOAPString
            class Attribute < ::String
              AttrType = XSD::QName.new(nil, "Type")

              include ModelHelper

              def __xmlattr
                @__xmlattr ||= {}
              end

              def xmlattr_type
                __xmlattr[AttrType]
              end

              def xmlattr_type=(value)
                __xmlattr[AttrType] = value
              end

              def initialize(*arg)
                super
                @__xmlattr = {}
              end

              def attribute_mapping
                @__attribute_mapping__ ||= {
                  Type: SOAP::SOAPString
                }
              end

              def element_mapping
                @__element_mapping__ ||= {

                }
              end
            end

            include ModelHelper

            attr_accessor :attribute
            attr_accessor :comment

            def initialize(attribute = nil, comment = [])
              @attribute = attribute
              @comment = comment
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {

              }
            end

            def element_mapping
              @__element_mapping__ ||= {
                attribute: ClinVar::RDF::Model::ObservationSet::C_Method::ObsMethodAttribute::Attribute,
                comment: ClinVar::RDF::Model::TypeComment
              }
            end
          end

          include ModelHelper

          attr_accessor :name_platform
          attr_accessor :type_platform
          attr_accessor :purpose
          attr_accessor :result_type
          attr_accessor :min_reported
          attr_accessor :max_reported
          attr_accessor :reference_standard
          attr_accessor :citation
          attr_accessor :x_ref
          attr_accessor :description
          attr_accessor :software
          attr_accessor :source_type
          attr_accessor :method_type
          attr_accessor :method_attribute
          attr_accessor :obs_method_attribute
          attr_accessor :type

          def initialize(name_platform = nil, type_platform = nil, purpose = nil, result_type = nil, min_reported = nil, max_reported = nil, reference_standard = nil, citation = [], x_ref = [], description = nil, software = [], source_type = nil, method_type = nil, method_attribute = [], obs_method_attribute = [], type = nil)
            @name_platform = name_platform
            @type_platform = type_platform
            @purpose = purpose
            @result_type = result_type
            @min_reported = min_reported
            @max_reported = max_reported
            @reference_standard = reference_standard
            @citation = citation
            @x_ref = x_ref
            @description = description
            @software = software
            @source_type = source_type
            @method_type = method_type
            @method_attribute = method_attribute
            @obs_method_attribute = obs_method_attribute
            @type = type
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {

            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              name_platform: SOAP::SOAPString,
              type_platform: SOAP::SOAPString,
              purpose: SOAP::SOAPString,
              result_type: SOAP::SOAPString,
              min_reported: SOAP::SOAPString,
              max_reported: SOAP::SOAPString,
              reference_standard: SOAP::SOAPString,
              citation: ClinVar::RDF::Model::TypeCitation,
              x_ref: ClinVar::RDF::Model::TypeXref,
              description: SOAP::SOAPString,
              software: ClinVar::RDF::Model::TypeSoftwareSet,
              source_type: SOAP::SOAPString,
              method_type: ClinVar::RDF::Model::TypeMethodlist,
              method_attribute: ClinVar::RDF::Model::ObservationSet::C_Method::MethodAttribute,
              obs_method_attribute: ClinVar::RDF::Model::ObservationSet::C_Method::ObsMethodAttribute,
              type: SOAP::SOAPString
            }
          end
        end

        # inner class for member: ObservedData
        # {}ObservedData
        #   attribute - ClinVar::RDF::Model::ObservationSet::ObservedData::Attribute
        #   severity - ClinVar::RDF::Model::TypeSeverity
        #   citation - ClinVar::RDF::Model::TypeCitation
        #   x_ref - ClinVar::RDF::Model::TypeXref
        #   comment - ClinVar::RDF::Model::TypeComment
        class ObservedData

          # inner class for member: Attribute
          # {}Attribute
          #   xmlattr_type - SOAP::SOAPString
          class Attribute < ::String
            AttrType = XSD::QName.new(nil, "Type")

            include ModelHelper

            def __xmlattr
              @__xmlattr ||= {}
            end

            def xmlattr_type
              __xmlattr[AttrType]
            end

            def xmlattr_type=(value)
              __xmlattr[AttrType] = value
            end

            def initialize(*arg)
              super
              @__xmlattr = {}
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {
                Type: SOAP::SOAPString
              }
            end

            def element_mapping
              @__element_mapping__ ||= {

              }
            end
          end

          include ModelHelper

          attr_accessor :attribute
          attr_accessor :severity
          attr_accessor :citation
          attr_accessor :x_ref
          attr_accessor :comment

          def initialize(attribute = nil, severity = nil, citation = [], x_ref = [], comment = [])
            @attribute = attribute
            @severity = severity
            @citation = citation
            @x_ref = x_ref
            @comment = comment
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {

            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              attribute: ClinVar::RDF::Model::ObservationSet::ObservedData::Attribute,
              severity: ClinVar::RDF::Model::TypeSeverity,
              citation: ClinVar::RDF::Model::TypeCitation,
              x_ref: ClinVar::RDF::Model::TypeXref,
              comment: ClinVar::RDF::Model::TypeComment
            }
          end
        end

        include ModelHelper

        attr_accessor :sample
        attr_accessor :method
        attr_accessor :observed_data
        attr_accessor :co_occurrence_set
        attr_accessor :trait_set
        attr_accessor :citation
        attr_accessor :x_ref
        attr_accessor :comment

        def initialize(sample = nil, method = [], observed_data = [], co_occurrence_set = [], trait_set = nil, citation = [], x_ref = [], comment = [])
          @sample = sample
          @method = method
          @observed_data = observed_data
          @co_occurrence_set = co_occurrence_set
          @trait_set = trait_set
          @citation = citation
          @x_ref = x_ref
          @comment = comment
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {

          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            sample: ClinVar::RDF::Model::TypeSample,
            method: ClinVar::RDF::Model::ObservationSet::C_Method,
            observed_data: ClinVar::RDF::Model::ObservationSet::ObservedData,
            co_occurrence_set: ClinVar::RDF::Model::CoOccurrenceType,
            trait_set: ClinVar::RDF::Model::ClinAsserTraitSetType,
            citation: ClinVar::RDF::Model::TypeCitation,
            x_ref: ClinVar::RDF::Model::TypeXref,
            comment: ClinVar::RDF::Model::TypeComment
          }
        end
      end

      # {}ClinAsserTraitSetType
      #   trait - ClinVar::RDF::Model::ClinAsserTraitType
      #   name - ClinVar::RDF::Model::SetElementSetType
      #   symbol - ClinVar::RDF::Model::SetElementSetType
      #   attribute_set - ClinVar::RDF::Model::ClinAsserTraitSetType::AttributeSet
      #   citation - ClinVar::RDF::Model::TypeCitation
      #   x_ref - ClinVar::RDF::Model::TypeXref
      #   comment - ClinVar::RDF::Model::TypeComment
      #   xmlattr_type - SOAP::SOAPString
      #   xmlattr_date_last_evaluated - SOAP::SOAPDate
      #   xmlattr_id - SOAP::SOAPPositiveInteger
      class ClinAsserTraitSetType
        AttrDateLastEvaluated = XSD::QName.new(nil, "DateLastEvaluated")
        AttrID = XSD::QName.new(nil, "ID")
        AttrType = XSD::QName.new(nil, "Type")

        # inner class for member: AttributeSet
        # {}AttributeSet
        #   attribute - ClinVar::RDF::Model::ClinAsserTraitSetType::AttributeSet::Attribute
        #   citation - ClinVar::RDF::Model::TypeCitation
        #   x_ref - ClinVar::RDF::Model::TypeXref
        #   comment - ClinVar::RDF::Model::TypeComment
        class AttributeSet

          # inner class for member: Attribute
          # {}Attribute
          #   xmlattr_type - SOAP::SOAPString
          class Attribute < ::String
            AttrType = XSD::QName.new(nil, "Type")

            include ModelHelper

            def __xmlattr
              @__xmlattr ||= {}
            end

            def xmlattr_type
              __xmlattr[AttrType]
            end

            def xmlattr_type=(value)
              __xmlattr[AttrType] = value
            end

            def initialize(*arg)
              super
              @__xmlattr = {}
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {
                Type: SOAP::SOAPString
              }
            end

            def element_mapping
              @__element_mapping__ ||= {

              }
            end
          end

          include ModelHelper

          attr_accessor :attribute
          attr_accessor :citation
          attr_accessor :x_ref
          attr_accessor :comment

          def initialize(attribute = nil, citation = [], x_ref = [], comment = [])
            @attribute = attribute
            @citation = citation
            @x_ref = x_ref
            @comment = comment
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {

            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              attribute: ClinVar::RDF::Model::ClinAsserTraitSetType::AttributeSet::Attribute,
              citation: ClinVar::RDF::Model::TypeCitation,
              x_ref: ClinVar::RDF::Model::TypeXref,
              comment: ClinVar::RDF::Model::TypeComment
            }
          end
        end

        include ModelHelper

        attr_accessor :trait
        attr_accessor :name
        attr_accessor :symbol
        attr_accessor :attribute_set
        attr_accessor :citation
        attr_accessor :x_ref
        attr_accessor :comment

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_type
          __xmlattr[AttrType]
        end

        def xmlattr_type=(value)
          __xmlattr[AttrType] = value
        end

        def xmlattr_date_last_evaluated
          __xmlattr[AttrDateLastEvaluated]
        end

        def xmlattr_date_last_evaluated=(value)
          __xmlattr[AttrDateLastEvaluated] = value
        end

        def xmlattr_id
          __xmlattr[AttrID]
        end

        def xmlattr_id=(value)
          __xmlattr[AttrID] = value
        end

        def initialize(trait = [], name = [], symbol = [], attribute_set = [], citation = [], x_ref = [], comment = [])
          @trait = trait
          @name = name
          @symbol = symbol
          @attribute_set = attribute_set
          @citation = citation
          @x_ref = x_ref
          @comment = comment
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            Type: SOAP::SOAPString,
            DateLastEvaluated: SOAP::SOAPDate,
            ID: SOAP::SOAPPositiveInteger
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            trait: ClinVar::RDF::Model::ClinAsserTraitType,
            name: ClinVar::RDF::Model::SetElementSetType,
            symbol: ClinVar::RDF::Model::SetElementSetType,
            attribute_set: ClinVar::RDF::Model::ClinAsserTraitSetType::AttributeSet,
            citation: ClinVar::RDF::Model::TypeCitation,
            x_ref: ClinVar::RDF::Model::TypeXref,
            comment: ClinVar::RDF::Model::TypeComment
          }
        end
      end

      # {}ClinAsserTraitType
      #   name - ClinVar::RDF::Model::SetElementSetType
      #   symbol - ClinVar::RDF::Model::SetElementSetType
      #   attribute_set - ClinVar::RDF::Model::ClinAsserTraitType::AttributeSet
      #   trait_relationship - ClinVar::RDF::Model::ClinAsserTraitType::TraitRelationship
      #   citation - ClinVar::RDF::Model::TypeCitation
      #   x_ref - ClinVar::RDF::Model::TypeXref
      #   comment - ClinVar::RDF::Model::TypeComment
      #   source - SOAP::SOAPString
      #   xmlattr_type - SOAP::SOAPString
      #   xmlattr_id - SOAP::SOAPPositiveInteger
      class ClinAsserTraitType
        AttrID = XSD::QName.new(nil, "ID")
        AttrType = XSD::QName.new(nil, "Type")

        # inner class for member: AttributeSet
        # {}AttributeSet
        #   attribute - ClinVar::RDF::Model::ClinAsserTraitType::AttributeSet::Attribute
        #   citation - ClinVar::RDF::Model::TypeCitation
        #   x_ref - ClinVar::RDF::Model::TypeXref
        #   comment - ClinVar::RDF::Model::TypeComment
        class AttributeSet

          # inner class for member: Attribute
          # {}Attribute
          #   xmlattr_type - SOAP::SOAPString
          class Attribute < ::String
            AttrType = XSD::QName.new(nil, "Type")

            include ModelHelper

            def __xmlattr
              @__xmlattr ||= {}
            end

            def xmlattr_type
              __xmlattr[AttrType]
            end

            def xmlattr_type=(value)
              __xmlattr[AttrType] = value
            end

            def initialize(*arg)
              super
              @__xmlattr = {}
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {
                Type: SOAP::SOAPString
              }
            end

            def element_mapping
              @__element_mapping__ ||= {

              }
            end
          end

          include ModelHelper

          attr_accessor :attribute
          attr_accessor :citation
          attr_accessor :x_ref
          attr_accessor :comment

          def initialize(attribute = nil, citation = [], x_ref = [], comment = [])
            @attribute = attribute
            @citation = citation
            @x_ref = x_ref
            @comment = comment
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {

            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              attribute: ClinVar::RDF::Model::ClinAsserTraitType::AttributeSet::Attribute,
              citation: ClinVar::RDF::Model::TypeCitation,
              x_ref: ClinVar::RDF::Model::TypeXref,
              comment: ClinVar::RDF::Model::TypeComment
            }
          end
        end

        # inner class for member: TraitRelationship
        # {}TraitRelationship
        #   name - ClinVar::RDF::Model::SetElementSetType
        #   symbol - ClinVar::RDF::Model::SetElementSetType
        #   attribute_set - ClinVar::RDF::Model::ClinAsserTraitType::TraitRelationship::AttributeSet
        #   citation - ClinVar::RDF::Model::TypeCitation
        #   x_ref - ClinVar::RDF::Model::TypeXref
        #   source - SOAP::SOAPString
        #   xmlattr_type - SOAP::SOAPString
        class TraitRelationship
          AttrType = XSD::QName.new(nil, "Type")

          # inner class for member: AttributeSet
          # {}AttributeSet
          #   attribute - ClinVar::RDF::Model::ClinAsserTraitType::TraitRelationship::AttributeSet::Attribute
          #   citation - ClinVar::RDF::Model::TypeCitation
          #   x_ref - ClinVar::RDF::Model::TypeXref
          #   comment - ClinVar::RDF::Model::TypeComment
          class AttributeSet

            # inner class for member: Attribute
            # {}Attribute
            #   xmlattr_type - SOAP::SOAPString
            class Attribute < ::String
              AttrType = XSD::QName.new(nil, "Type")

              include ModelHelper

              def __xmlattr
                @__xmlattr ||= {}
              end

              def xmlattr_type
                __xmlattr[AttrType]
              end

              def xmlattr_type=(value)
                __xmlattr[AttrType] = value
              end

              def initialize(*arg)
                super
                @__xmlattr = {}
              end

              def attribute_mapping
                @__attribute_mapping__ ||= {
                  Type: SOAP::SOAPString
                }
              end

              def element_mapping
                @__element_mapping__ ||= {

                }
              end
            end

            include ModelHelper

            attr_accessor :attribute
            attr_accessor :citation
            attr_accessor :x_ref
            attr_accessor :comment

            def initialize(attribute = nil, citation = [], x_ref = [], comment = [])
              @attribute = attribute
              @citation = citation
              @x_ref = x_ref
              @comment = comment
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {

              }
            end

            def element_mapping
              @__element_mapping__ ||= {
                attribute: ClinVar::RDF::Model::ClinAsserTraitType::TraitRelationship::AttributeSet::Attribute,
                citation: ClinVar::RDF::Model::TypeCitation,
                x_ref: ClinVar::RDF::Model::TypeXref,
                comment: ClinVar::RDF::Model::TypeComment
              }
            end
          end

          include ModelHelper

          attr_accessor :name
          attr_accessor :symbol
          attr_accessor :attribute_set
          attr_accessor :citation
          attr_accessor :x_ref
          attr_accessor :source

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_type
            __xmlattr[AttrType]
          end

          def xmlattr_type=(value)
            __xmlattr[AttrType] = value
          end

          def initialize(name = [], symbol = [], attribute_set = [], citation = [], x_ref = [], source = [])
            @name = name
            @symbol = symbol
            @attribute_set = attribute_set
            @citation = citation
            @x_ref = x_ref
            @source = source
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Type: SOAP::SOAPString
            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              name: ClinVar::RDF::Model::SetElementSetType,
              symbol: ClinVar::RDF::Model::SetElementSetType,
              attribute_set: ClinVar::RDF::Model::ClinAsserTraitType::TraitRelationship::AttributeSet,
              citation: ClinVar::RDF::Model::TypeCitation,
              x_ref: ClinVar::RDF::Model::TypeXref,
              source: SOAP::SOAPString
            }
          end
        end

        include ModelHelper

        attr_accessor :name
        attr_accessor :symbol
        attr_accessor :attribute_set
        attr_accessor :trait_relationship
        attr_accessor :citation
        attr_accessor :x_ref
        attr_accessor :comment
        attr_accessor :source

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_type
          __xmlattr[AttrType]
        end

        def xmlattr_type=(value)
          __xmlattr[AttrType] = value
        end

        def xmlattr_id
          __xmlattr[AttrID]
        end

        def xmlattr_id=(value)
          __xmlattr[AttrID] = value
        end

        def initialize(name = [], symbol = [], attribute_set = [], trait_relationship = [], citation = [], x_ref = [], comment = [], source = [])
          @name = name
          @symbol = symbol
          @attribute_set = attribute_set
          @trait_relationship = trait_relationship
          @citation = citation
          @x_ref = x_ref
          @comment = comment
          @source = source
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            Type: SOAP::SOAPString,
            ID: SOAP::SOAPPositiveInteger
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            name: ClinVar::RDF::Model::SetElementSetType,
            symbol: ClinVar::RDF::Model::SetElementSetType,
            attribute_set: ClinVar::RDF::Model::ClinAsserTraitType::AttributeSet,
            trait_relationship: ClinVar::RDF::Model::ClinAsserTraitType::TraitRelationship,
            citation: ClinVar::RDF::Model::TypeCitation,
            x_ref: ClinVar::RDF::Model::TypeXref,
            comment: ClinVar::RDF::Model::TypeComment,
            source: SOAP::SOAPString
          }
        end
      end

      # {}SetElementSetType
      #   element_value - ClinVar::RDF::Model::SetElementSetType::ElementValue
      #   citation - ClinVar::RDF::Model::TypeCitation
      #   x_ref - ClinVar::RDF::Model::TypeXref
      #   comment - ClinVar::RDF::Model::TypeComment
      class SetElementSetType

        # inner class for member: ElementValue
        # {}ElementValue
        #   xmlattr_type - SOAP::SOAPString
        class ElementValue < ::String
          AttrType = XSD::QName.new(nil, "Type")

          include ModelHelper

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_type
            __xmlattr[AttrType]
          end

          def xmlattr_type=(value)
            __xmlattr[AttrType] = value
          end

          def initialize(*arg)
            super
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Type: SOAP::SOAPString
            }
          end

          def element_mapping
            @__element_mapping__ ||= {

            }
          end
        end

        include ModelHelper

        attr_accessor :element_value
        attr_accessor :citation
        attr_accessor :x_ref
        attr_accessor :comment

        def initialize(element_value = nil, citation = [], x_ref = [], comment = [])
          @element_value = element_value
          @citation = citation
          @x_ref = x_ref
          @comment = comment
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {

          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            element_value: ClinVar::RDF::Model::SetElementSetType::ElementValue,
            citation: ClinVar::RDF::Model::TypeCitation,
            x_ref: ClinVar::RDF::Model::TypeXref,
            comment: ClinVar::RDF::Model::TypeComment
          }
        end
      end

      # {}typeAttributeSet
      #   attribute - ClinVar::RDF::Model::TypeAttributeSet::Attribute
      #   citation - ClinVar::RDF::Model::TypeCitation
      #   x_ref - ClinVar::RDF::Model::TypeXref
      #   comment - ClinVar::RDF::Model::TypeComment
      class TypeAttributeSet

        # inner class for member: Attribute
        # {}Attribute
        #   xmlattr_type - SOAP::SOAPString
        class Attribute < ::String
          AttrType = XSD::QName.new(nil, "Type")

          include ModelHelper

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_type
            __xmlattr[AttrType]
          end

          def xmlattr_type=(value)
            __xmlattr[AttrType] = value
          end

          def initialize(*arg)
            super
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Type: SOAP::SOAPString
            }
          end

          def element_mapping
            @__element_mapping__ ||= {

            }
          end
        end

        include ModelHelper

        attr_accessor :attribute
        attr_accessor :citation
        attr_accessor :x_ref
        attr_accessor :comment

        def initialize(attribute = nil, citation = [], x_ref = [], comment = [])
          @attribute = attribute
          @citation = citation
          @x_ref = x_ref
          @comment = comment
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {

          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            attribute: ClinVar::RDF::Model::TypeAttributeSet::Attribute,
            citation: ClinVar::RDF::Model::TypeCitation,
            x_ref: ClinVar::RDF::Model::TypeXref,
            comment: ClinVar::RDF::Model::TypeComment
          }
        end
      end

      # {}IndicationType
      #   trait - ClinVar::RDF::Model::ClinAsserTraitType
      #   name - ClinVar::RDF::Model::SetElementSetType
      #   symbol - ClinVar::RDF::Model::SetElementSetType
      #   attribute_set - ClinVar::RDF::Model::TypeAttributeSet
      #   citation - ClinVar::RDF::Model::TypeCitation
      #   x_ref - ClinVar::RDF::Model::TypeXref
      #   comment - ClinVar::RDF::Model::TypeComment
      #   xmlattr_type - SOAP::SOAPString
      #   xmlattr_id - SOAP::SOAPPositiveInteger
      class IndicationType
        AttrID = XSD::QName.new(nil, "ID")
        AttrType = XSD::QName.new(nil, "Type")

        include ModelHelper

        attr_accessor :trait
        attr_accessor :name
        attr_accessor :symbol
        attr_accessor :attribute_set
        attr_accessor :citation
        attr_accessor :x_ref
        attr_accessor :comment

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_type
          __xmlattr[AttrType]
        end

        def xmlattr_type=(value)
          __xmlattr[AttrType] = value
        end

        def xmlattr_id
          __xmlattr[AttrID]
        end

        def xmlattr_id=(value)
          __xmlattr[AttrID] = value
        end

        def initialize(trait = [], name = [], symbol = [], attribute_set = [], citation = [], x_ref = [], comment = nil)
          @trait = trait
          @name = name
          @symbol = symbol
          @attribute_set = attribute_set
          @citation = citation
          @x_ref = x_ref
          @comment = comment
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            Type: SOAP::SOAPString,
            ID: SOAP::SOAPPositiveInteger
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            trait: ClinVar::RDF::Model::ClinAsserTraitType,
            name: ClinVar::RDF::Model::SetElementSetType,
            symbol: ClinVar::RDF::Model::SetElementSetType,
            attribute_set: ClinVar::RDF::Model::TypeAttributeSet,
            citation: ClinVar::RDF::Model::TypeCitation,
            x_ref: ClinVar::RDF::Model::TypeXref,
            comment: ClinVar::RDF::Model::TypeComment
          }
        end
      end

      # {}ClinicalSignificanceType
      #   review_status - ClinVar::RDF::Model::TypeSubmitterReviewStatusValue
      #   description - SOAP::SOAPString
      #   explanation - ClinVar::RDF::Model::TypeComment
      #   x_ref - ClinVar::RDF::Model::TypeXref
      #   citation - ClinVar::RDF::Model::TypeCitation
      #   comment - ClinVar::RDF::Model::TypeComment
      #   xmlattr_date_last_evaluated - SOAP::SOAPDate
      class ClinicalSignificanceType
        AttrDateLastEvaluated = XSD::QName.new(nil, "DateLastEvaluated")

        include ModelHelper

        attr_accessor :review_status
        attr_accessor :description
        attr_accessor :explanation
        attr_accessor :x_ref
        attr_accessor :citation
        attr_accessor :comment

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_date_last_evaluated
          __xmlattr[AttrDateLastEvaluated]
        end

        def xmlattr_date_last_evaluated=(value)
          __xmlattr[AttrDateLastEvaluated] = value
        end

        def initialize(review_status = nil, description = nil, explanation = nil, x_ref = [], citation = [], comment = [])
          @review_status = review_status
          @description = description
          @explanation = explanation
          @x_ref = x_ref
          @citation = citation
          @comment = comment
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            DateLastEvaluated: SOAP::SOAPDate
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            review_status: ClinVar::RDF::Model::TypeSubmitterReviewStatusValue,
            description: SOAP::SOAPString,
            explanation: ClinVar::RDF::Model::TypeComment,
            x_ref: ClinVar::RDF::Model::TypeXref,
            citation: ClinVar::RDF::Model::TypeCitation,
            comment: ClinVar::RDF::Model::TypeComment
          }
        end
      end

      # {}typeRecordHistory
      #   comment - ClinVar::RDF::Model::TypeComment
      #   xmlattr_accession - SOAP::SOAPString
      #   xmlattr_version - SOAP::SOAPNonNegativeInteger
      #   xmlattr_date_changed - SOAP::SOAPDate
      #   xmlattr_variation_id - SOAP::SOAPNonNegativeInteger
      class TypeRecordHistory
        AttrAccession = XSD::QName.new(nil, "Accession")
        AttrDateChanged = XSD::QName.new(nil, "DateChanged")
        AttrVariationID = XSD::QName.new(nil, "VariationID")
        AttrVersion = XSD::QName.new(nil, "Version")

        include ModelHelper

        attr_accessor :comment

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_accession
          __xmlattr[AttrAccession]
        end

        def xmlattr_accession=(value)
          __xmlattr[AttrAccession] = value
        end

        def xmlattr_version
          __xmlattr[AttrVersion]
        end

        def xmlattr_version=(value)
          __xmlattr[AttrVersion] = value
        end

        def xmlattr_date_changed
          __xmlattr[AttrDateChanged]
        end

        def xmlattr_date_changed=(value)
          __xmlattr[AttrDateChanged] = value
        end

        def xmlattr_variation_id
          __xmlattr[AttrVariationID]
        end

        def xmlattr_variation_id=(value)
          __xmlattr[AttrVariationID] = value
        end

        def initialize(comment = nil)
          @comment = comment
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            Accession: SOAP::SOAPString,
            Version: SOAP::SOAPNonNegativeInteger,
            DateChanged: SOAP::SOAPDate,
            VariationID: SOAP::SOAPNonNegativeInteger
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            comment: ClinVar::RDF::Model::TypeComment
          }
        end
      end

      # {}typeGenotypeSCV
      #   simple_allele - ClinVar::RDF::Model::TypeAlleleSCV
      #   haplotype - ClinVar::RDF::Model::TypeHaplotypeSCV
      #   name - SOAP::SOAPString
      #   variation_type - ClinVar::RDF::Model::TypeVariationType
      #   functional_consequence - ClinVar::RDF::Model::TypeGenotypeSCV::FunctionalConsequence
      #   interpretations - ClinVar::RDF::Model::TypeAggregatedInterpretationSet
      #   x_ref_list - ClinVar::RDF::Model::TypeGenotypeSCV::XRefList
      #   citation_list - ClinVar::RDF::Model::TypeGenotypeSCV::CitationList
      #   comment - ClinVar::RDF::Model::TypeComment
      #   attribute_set - ClinVar::RDF::Model::TypeAttributeSet
      #   xmlattr_variation_id - SOAP::SOAPInt
      class TypeGenotypeSCV
        AttrVariationID = XSD::QName.new(nil, "VariationID")

        # inner class for member: FunctionalConsequence
        # {}FunctionalConsequence
        #   x_ref - ClinVar::RDF::Model::TypeXref
        #   citation - ClinVar::RDF::Model::TypeCitation
        #   comment - ClinVar::RDF::Model::TypeComment
        #   xmlattr_value - SOAP::SOAPString
        class FunctionalConsequence
          AttrValue = XSD::QName.new(nil, "Value")

          include ModelHelper

          attr_accessor :x_ref
          attr_accessor :citation
          attr_accessor :comment

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_value
            __xmlattr[AttrValue]
          end

          def xmlattr_value=(value)
            __xmlattr[AttrValue] = value
          end

          def initialize(x_ref = [], citation = [], comment = [])
            @x_ref = x_ref
            @citation = citation
            @comment = comment
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              Value: SOAP::SOAPString
            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              x_ref: ClinVar::RDF::Model::TypeXref,
              citation: ClinVar::RDF::Model::TypeCitation,
              comment: ClinVar::RDF::Model::TypeComment
            }
          end
        end

        # inner class for member: XRefList
        # {}XRefList
        class XRefList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeXref
          end
        end

        # inner class for member: CitationList
        # {}CitationList
        class CitationList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeCitation
          end
        end

        include ModelHelper

        attr_accessor :simple_allele
        attr_accessor :haplotype
        attr_accessor :name
        attr_accessor :variation_type
        attr_accessor :functional_consequence
        attr_accessor :interpretations
        attr_accessor :x_ref_list
        attr_accessor :citation_list
        attr_accessor :comment
        attr_accessor :attribute_set

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_variation_id
          __xmlattr[AttrVariationID]
        end

        def xmlattr_variation_id=(value)
          __xmlattr[AttrVariationID] = value
        end

        def initialize(simple_allele = [], haplotype = [], name = nil, variation_type = nil, functional_consequence = [], interpretations = [], x_ref_list = nil, citation_list = nil, comment = [], attribute_set = [])
          @simple_allele = simple_allele
          @haplotype = haplotype
          @name = name
          @variation_type = variation_type
          @functional_consequence = functional_consequence
          @interpretations = interpretations
          @x_ref_list = x_ref_list
          @citation_list = citation_list
          @comment = comment
          @attribute_set = attribute_set
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            VariationID: SOAP::SOAPInt
          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            simple_allele: ClinVar::RDF::Model::TypeAlleleSCV,
            haplotype: ClinVar::RDF::Model::TypeHaplotypeSCV,
            name: SOAP::SOAPString,
            variation_type: ClinVar::RDF::Model::TypeVariationType,
            functional_consequence: ClinVar::RDF::Model::TypeGenotypeSCV::FunctionalConsequence,
            interpretations: ClinVar::RDF::Model::TypeAggregatedInterpretationSet,
            x_ref_list: ClinVar::RDF::Model::TypeGenotypeSCV::XRefList,
            citation_list: ClinVar::RDF::Model::TypeGenotypeSCV::CitationList,
            comment: ClinVar::RDF::Model::TypeComment,
            attribute_set: ClinVar::RDF::Model::TypeAttributeSet
          }
        end
      end

      # {}typeRCVInterpretedCondition
      #   xmlattr_db - SOAP::SOAPString
      #   xmlattr_id - SOAP::SOAPString
      class TypeRCVInterpretedCondition < ::String
        AttrDB = XSD::QName.new(nil, "DB")
        AttrID = XSD::QName.new(nil, "ID")

        include ModelHelper

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_db
          __xmlattr[AttrDB]
        end

        def xmlattr_db=(value)
          __xmlattr[AttrDB] = value
        end

        def xmlattr_id
          __xmlattr[AttrID]
        end

        def xmlattr_id=(value)
          __xmlattr[AttrID] = value
        end

        def initialize(*arg)
          super
          @__xmlattr = {}
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {
            DB: SOAP::SOAPString,
            ID: SOAP::SOAPString
          }
        end

        def element_mapping
          @__element_mapping__ ||= {

          }
        end
      end

      # {}typeGeneVariant
      # Type: SimpleType
      class TypeGeneVariant < ::String
        AssertedButNotComputed = new("asserted, but not computed")
        GeneOverlappedByVariant = new("gene overlapped by variant")
        GenesOverlappedByVariant = new("genes overlapped by variant")
        NearGeneDownstream = new("near gene, downstream")
        NearGeneUpstream = new("near gene, upstream")
        VariantNearGeneDownstream = new("variant near gene, downstream")
        VariantNearGeneUpstream = new("variant near gene, upstream")
        VariantWithinGene = new("variant within gene")
        WithinMultipleGenesByOverlap = new("within multiple genes by overlap")
        WithinSingleGene = new("within single gene")
      end

      # {}typeSeverity
      # Type: SimpleType
      class TypeSeverity < ::String
        Mild = new("mild")
        Moderate = new("moderate")
        Severe = new("severe")
      end

      # {}typeStatus
      # Type: SimpleType
      class TypeStatus < ::String
        CompletedAndRetired = new("completed and retired")
        Current = new("current")
        Delete = new("delete")
        InDevelopment = new("in development")
        Reclassified = new("reclassified")
        Reject = new("reject")
        Secondary = new("secondary")
        Suppressed = new("suppressed")
        UnderReview = new("under review")
      end

      # {}typeSubmitterReviewStatusValue
      # Type: SimpleType
      class TypeSubmitterReviewStatusValue < ::String
        ClassifiedByMultipleSubmitters = new("classified by multiple submitters")
        ClassifiedBySingleSubmitter = new("classified by single submitter")
        CriteriaProvidedConflictingInterpretations = new("criteria provided, conflicting interpretations")
        CriteriaProvidedMultipleSubmittersNoConflicts = new("criteria provided, multiple submitters, no conflicts")
        CriteriaProvidedSingleSubmitter = new("criteria provided, single submitter")
        NoAssertionCriteriaProvided = new("no assertion criteria provided")
        NoAssertionProvided = new("no assertion provided")
        NotClassifiedBySubmitter = new("not classified by submitter")
        PracticeGuideline = new("practice guideline")
        ReviewedByExpertPanel = new("reviewed by expert panel")
        ReviewedByProfessionalSociety = new("reviewed by professional society")
      end

      # {}typeZygosity
      # Type: SimpleType
      class TypeZygosity < ::String
        CompoundHeterozygote = new("CompoundHeterozygote")
        Hemizygote = new("Hemizygote")
        Homozygote = new("Homozygote")
        NotProvided = new("not provided")
        SingleHeterozygote = new("SingleHeterozygote")
      end

      # {}typeAssertionTypeAttr
      # Type: SimpleType
      class TypeAssertionTypeAttr < ::String
        ConfersResistance = new("confers resistance")
        ConfersSensitivity = new("confers sensitivity")
        VariantToNamedProtein = new("variant to named protein")
        VariationInModifierGeneToDisease = new("variation in modifier gene to disease")
        VariationToDisease = new("variation to disease")
        VariationToIncludedDisease = new("variation to included disease")
      end

      # {}typeAggregateReviewStatusValue
      # Type: SimpleType
      class TypeAggregateReviewStatusValue < ::String
        CriteriaProvidedConflictingInterpretations = new("criteria provided, conflicting interpretations")
        CriteriaProvidedMultipleSubmittersNoConflicts = new("criteria provided, multiple submitters, no conflicts")
        CriteriaProvidedSingleSubmitter = new("criteria provided, single submitter")
        NoAssertionCriteriaProvided = new("no assertion criteria provided")
        NoAssertionProvided = new("no assertion provided")
        PracticeGuideline = new("practice guideline")
        ReviewedByExpertPanel = new("reviewed by expert panel")
      end

      # {}typeOrigin
      # Type: SimpleType
      class TypeOrigin < ::String
        Biparental = new("biparental")
        DeNovo = new("de novo")
        ExperimentallyGenerated = new("experimentally generated")
        Germline = new("germline")
        Inherited = new("inherited")
        Maternal = new("maternal")
        NotApplicable = new("not applicable")
        NotProvided = new("not provided")
        NotReported = new("not-reported")
        Paternal = new("paternal")
        Somatic = new("somatic")
        TestedInconclusive = new("tested-inconclusive")
        Uniparental = new("uniparental")
        Unknown = new("unknown")
      end

      # {}typeChromosomeStr
      # Type: SimpleType
      class TypeChromosomeStr < ::String
        MT = new("MT")
        PAR = new("PAR")
        Un = new("Un")
        X = new("X")
        Y = new("Y")
      end

      # {}typeChromosome
      #  any of typeChromosomeNr typeChromosomeStr
      # Type: SimpleType
      class TypeChromosome < ::String
      end

      # {}typeCommentType
      # Type: SimpleType
      class TypeCommentType < ::String
        AlignmentGapMakesAppearInconsistent = new("AlignmentGapMakesAppearInconsistent")
        AssemblySpecificAlleleDefinition = new("AssemblySpecificAlleleDefinition")
        ConvertedByNCBI = new("ConvertedByNCBI")
        DeletionComment = new("DeletionComment")
        ExplanationOfInterpretation = new("ExplanationOfInterpretation")
        GenomicLocationNotEstablished = new("GenomicLocationNotEstablished")
        LocationOnGenomeAndProductNotAligned = new("LocationOnGenomeAndProductNotAligned")
        MergeComment = new("MergeComment")
        MissingFromAssembly = new("MissingFromAssembly")
        Public = new("public")
      end

      # {}typeNucleotideSequence
      # Type: SimpleType
      class TypeNucleotideSequence < ::String
        Coding = new("coding")
        Genomic = new("genomic")
        GenomicRefSeqGene = new("genomic, RefSeqGene")
        GenomicTopLevel = new("genomic, top-level")
        NonCoding = new("non-coding")
        Protein = new("protein")
      end

      # {}typeProteinSequence
      # Type: SimpleType
      class TypeProteinSequence < ::String
        Protein = new("protein")
      end

      # {}typePhenotypeSet
      # Type: SimpleType
      class TypePhenotypeSet < ::String
        Disease = new("Disease")
        DrugResponse = new("DrugResponse")
        Finding = new("Finding")
        PhenotypeInstruction = new("PhenotypeInstruction")
        TraitChoice = new("TraitChoice")
      end

      # {}typeVariationType
      # Type: SimpleType
      class TypeVariationType < ::String
        CompoundHeterozygote = new("CompoundHeterozygote")
        Diplotype = new("Diplotype")
      end

      # {}typeEvidencetype
      # Type: SimpleType
      class TypeEvidencetype < ::String
        Computational = new("Computational")
        Experimental = new("Experimental")
        Genetic = new("Genetic")
        Population = new("Population")
      end

      # {}typeInterpretation
      # Type: SimpleType
      class TypeInterpretation < ::String
        Association = new("Association")
        ClinicalSignificance = new("Clinical significance")
        FunctionalStatus = new("Functional status")
      end

      # {}typeMethodlist
      # Type: SimpleType
      class TypeMethodlist < ::String
        CaseControl = new("case-control")
        ClinicalTesting = new("clinical testing")
        Curation = new("curation")
        InVitro = new("in vitro")
        InVivo = new("in vivo")
        LiteratureOnly = new("literature only")
        NotProvided = new("not provided")
        PhenotypingOnly = new("phenotyping only")
        ProviderInterpretation = new("provider interpretation")
        ReferencePopulation = new("reference population")
        Research = new("research")
      end

      # {}typeHGVS
      # Type: SimpleType
      class TypeHGVS < ::String
        Coding = new("coding")
        Genomic = new("genomic")
        GenomicTopLevel = new("genomic, top-level")
        NonCoding = new("non-coding")
        Protein = new("protein")
      end

      # {}typeHaplotypeVariationType
      # Type: SimpleType
      class TypeHaplotypeVariationType < ::String
        Haplotype = new("Haplotype")
        PhaseUnknown = new("Phase unknown")
        Variation = new("Variation")
      end

      # {}InterpretedRecord
      #   simple_allele - ClinVar::RDF::Model::TypeAllele
      #   haplotype - ClinVar::RDF::Model::TypeHaplotype
      #   genotype - ClinVar::RDF::Model::TypeGenotype
      #   review_status - ClinVar::RDF::Model::TypeAggregateReviewStatusValue
      #   rcv_list - ClinVar::RDF::Model::InterpretedRecord::RCVList
      #   interpretations - ClinVar::RDF::Model::TypeAggregatedInterpretationSet
      #   clinical_assertion_list - ClinVar::RDF::Model::InterpretedRecord::ClinicalAssertionList
      #   trait_mapping_list - ClinVar::RDF::Model::InterpretedRecord::TraitMappingList
      #   deleted_scv_list - ClinVar::RDF::Model::InterpretedRecord::DeletedSCVList
      #   general_citations - ClinVar::RDF::Model::InterpretedRecord::GeneralCitations
      class InterpretedRecord

        # inner class for member: RCVList
        # {}RCVList
        #   rcv_accession - ClinVar::RDF::Model::TypeRCV
        #   xmlattr_submission_count - SOAP::SOAPPositiveInteger
        #   xmlattr_independent_observations - SOAP::SOAPPositiveInteger
        class RCVList
          AttrIndependentObservations = XSD::QName.new(nil, "IndependentObservations")
          AttrSubmissionCount = XSD::QName.new(nil, "SubmissionCount")

          include ModelHelper

          attr_accessor :rcv_accession

          def __xmlattr
            @__xmlattr ||= {}
          end

          def xmlattr_submission_count
            __xmlattr[AttrSubmissionCount]
          end

          def xmlattr_submission_count=(value)
            __xmlattr[AttrSubmissionCount] = value
          end

          def xmlattr_independent_observations
            __xmlattr[AttrIndependentObservations]
          end

          def xmlattr_independent_observations=(value)
            __xmlattr[AttrIndependentObservations] = value
          end

          def initialize(rcv_accession = [])
            @rcv_accession = rcv_accession
            @__xmlattr = {}
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {
              SubmissionCount: SOAP::SOAPPositiveInteger,
              IndependentObservations: SOAP::SOAPPositiveInteger
            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              rcv_accession: ClinVar::RDF::Model::TypeRCV
            }
          end
        end

        # inner class for member: ClinicalAssertionList
        # {}ClinicalAssertionList
        class ClinicalAssertionList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::MeasureTraitType
          end
        end

        # inner class for member: TraitMappingList
        # {}TraitMappingList
        class TraitMappingList < ::Array

          # {}TraitMapping
          #   med_gen - ClinVar::RDF::Model::InterpretedRecord::TraitMappingList::TraitMapping::MedGen
          #   xmlattr_clinical_assertion_id - SOAP::SOAPPositiveInteger
          #   xmlattr_trait_type - SOAP::SOAPString
          #   xmlattr_mapping_type - SOAP::SOAPString
          #   xmlattr_mapping_value - SOAP::SOAPString
          #   xmlattr_mapping_ref - SOAP::SOAPString
          class TraitMapping
            AttrClinicalAssertionID = XSD::QName.new(nil, "ClinicalAssertionID")
            AttrMappingRef = XSD::QName.new(nil, "MappingRef")
            AttrMappingType = XSD::QName.new(nil, "MappingType")
            AttrMappingValue = XSD::QName.new(nil, "MappingValue")
            AttrTraitType = XSD::QName.new(nil, "TraitType")

            # inner class for member: MedGen
            # {}MedGen
            #   xmlattr_name - SOAP::SOAPString
            #   xmlattr_cui - SOAP::SOAPString
            class MedGen
              AttrCUI = XSD::QName.new(nil, "CUI")
              AttrName = XSD::QName.new(nil, "Name")

              include ModelHelper

              def __xmlattr
                @__xmlattr ||= {}
              end

              def xmlattr_name
                __xmlattr[AttrName]
              end

              def xmlattr_name=(value)
                __xmlattr[AttrName] = value
              end

              def xmlattr_cui
                __xmlattr[AttrCUI]
              end

              def xmlattr_cui=(value)
                __xmlattr[AttrCUI] = value
              end

              def initialize(*args)
                @__xmlattr = {}
              end

              def attribute_mapping
                @__attribute_mapping__ ||= {
                  Name: SOAP::SOAPString,
                  CUI: SOAP::SOAPString
                }
              end

              def element_mapping
                @__element_mapping__ ||= {

                }
              end
            end

            include ModelHelper

            attr_accessor :med_gen

            def __xmlattr
              @__xmlattr ||= {}
            end

            def xmlattr_clinical_assertion_id
              __xmlattr[AttrClinicalAssertionID]
            end

            def xmlattr_clinical_assertion_id=(value)
              __xmlattr[AttrClinicalAssertionID] = value
            end

            def xmlattr_trait_type
              __xmlattr[AttrTraitType]
            end

            def xmlattr_trait_type=(value)
              __xmlattr[AttrTraitType] = value
            end

            def xmlattr_mapping_type
              __xmlattr[AttrMappingType]
            end

            def xmlattr_mapping_type=(value)
              __xmlattr[AttrMappingType] = value
            end

            def xmlattr_mapping_value
              __xmlattr[AttrMappingValue]
            end

            def xmlattr_mapping_value=(value)
              __xmlattr[AttrMappingValue] = value
            end

            def xmlattr_mapping_ref
              __xmlattr[AttrMappingRef]
            end

            def xmlattr_mapping_ref=(value)
              __xmlattr[AttrMappingRef] = value
            end

            def initialize(med_gen = nil)
              @med_gen = med_gen
              @__xmlattr = {}
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {
                ClinicalAssertionID: SOAP::SOAPPositiveInteger,
                TraitType: SOAP::SOAPString,
                MappingType: SOAP::SOAPString,
                MappingValue: SOAP::SOAPString,
                MappingRef: SOAP::SOAPString
              }
            end

            def element_mapping
              @__element_mapping__ ||= {
                med_gen: ClinVar::RDF::Model::InterpretedRecord::TraitMappingList::TraitMapping::MedGen
              }
            end
          end

          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::InterpretedRecord::TraitMappingList::TraitMapping
          end
        end

        # inner class for member: DeletedSCVList
        # {}DeletedSCVList
        class DeletedSCVList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeDeletedSCV
          end
        end

        # inner class for member: GeneralCitations
        # {}GeneralCitations
        #   citation - ClinVar::RDF::Model::TypeCitation
        #   x_ref - ClinVar::RDF::Model::TypeXref
        class GeneralCitations
          include ModelHelper

          attr_accessor :citation
          attr_accessor :x_ref

          def initialize(citation = [], x_ref = [])
            @citation = citation
            @x_ref = x_ref
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {

            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              citation: ClinVar::RDF::Model::TypeCitation,
              x_ref: ClinVar::RDF::Model::TypeXref
            }
          end
        end

        include ModelHelper

        attr_accessor :simple_allele
        attr_accessor :haplotype
        attr_accessor :genotype
        attr_accessor :review_status
        attr_accessor :rcv_list
        attr_accessor :interpretations
        attr_accessor :clinical_assertion_list
        attr_accessor :trait_mapping_list
        attr_accessor :deleted_scv_list
        attr_accessor :general_citations

        def initialize(simple_allele = nil, haplotype = nil, genotype = nil, review_status = nil, rcv_list = nil, interpretations = nil, clinical_assertion_list = nil, trait_mapping_list = nil, deleted_scv_list = nil, general_citations = [])
          @simple_allele = simple_allele
          @haplotype = haplotype
          @genotype = genotype
          @review_status = review_status
          @rcv_list = rcv_list
          @interpretations = interpretations
          @clinical_assertion_list = clinical_assertion_list
          @trait_mapping_list = trait_mapping_list
          @deleted_scv_list = deleted_scv_list
          @general_citations = general_citations
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {

          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            simple_allele: ClinVar::RDF::Model::TypeAllele,
            haplotype: ClinVar::RDF::Model::TypeHaplotype,
            genotype: ClinVar::RDF::Model::TypeGenotype,
            review_status: ClinVar::RDF::Model::TypeAggregateReviewStatusValue,
            rcv_list: ClinVar::RDF::Model::InterpretedRecord::RCVList,
            interpretations: ClinVar::RDF::Model::TypeAggregatedInterpretationSet,
            clinical_assertion_list: ClinVar::RDF::Model::InterpretedRecord::ClinicalAssertionList,
            trait_mapping_list: ClinVar::RDF::Model::InterpretedRecord::TraitMappingList,
            deleted_scv_list: ClinVar::RDF::Model::InterpretedRecord::DeletedSCVList,
            general_citations: ClinVar::RDF::Model::InterpretedRecord::GeneralCitations
          }
        end
      end

      # {}IncludedRecord
      #   simple_allele - ClinVar::RDF::Model::TypeAllele
      #   haplotype - ClinVar::RDF::Model::TypeHaplotype
      #   submitted_interpretation_list - ClinVar::RDF::Model::IncludedRecord::SubmittedInterpretationList
      #   interpreted_variation_list - ClinVar::RDF::Model::IncludedRecord::InterpretedVariationList
      #   general_citations - ClinVar::RDF::Model::IncludedRecord::GeneralCitations
      class IncludedRecord

        # inner class for member: SubmittedInterpretationList
        # {}SubmittedInterpretationList
        class SubmittedInterpretationList < ::Array
          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::TypeSCV
          end
        end

        # inner class for member: InterpretedVariationList
        # {}InterpretedVariationList
        class InterpretedVariationList < ::Array

          # {}InterpretedVariation
          #   xmlattr_variation_id - SOAP::SOAPPositiveInteger
          #   xmlattr_accession - SOAP::SOAPString
          #   xmlattr_version - SOAP::SOAPInteger
          class InterpretedVariation
            AttrAccession = XSD::QName.new(nil, "Accession")
            AttrVariationID = XSD::QName.new(nil, "VariationID")
            AttrVersion = XSD::QName.new(nil, "Version")

            include ModelHelper

            def __xmlattr
              @__xmlattr ||= {}
            end

            def xmlattr_variation_id
              __xmlattr[AttrVariationID]
            end

            def xmlattr_variation_id=(value)
              __xmlattr[AttrVariationID] = value
            end

            def xmlattr_accession
              __xmlattr[AttrAccession]
            end

            def xmlattr_accession=(value)
              __xmlattr[AttrAccession] = value
            end

            def xmlattr_version
              __xmlattr[AttrVersion]
            end

            def xmlattr_version=(value)
              __xmlattr[AttrVersion] = value
            end

            def initialize(*args)
              @__xmlattr = {}
            end

            def attribute_mapping
              @__attribute_mapping__ ||= {
                VariationID: SOAP::SOAPPositiveInteger,
                Accession: SOAP::SOAPString,
                Version: SOAP::SOAPInteger
              }
            end

            def element_mapping
              @__element_mapping__ ||= {

              }
            end
          end

          include ModelHelper

          def self.element_type
            ClinVar::RDF::Model::IncludedRecord::InterpretedVariationList::InterpretedVariation
          end
        end

        # inner class for member: GeneralCitations
        # {}GeneralCitations
        #   citation - ClinVar::RDF::Model::TypeCitation
        #   x_ref - ClinVar::RDF::Model::TypeXref
        class GeneralCitations
          include ModelHelper

          attr_accessor :citation
          attr_accessor :x_ref

          def initialize(citation = [], x_ref = [])
            @citation = citation
            @x_ref = x_ref
          end

          def attribute_mapping
            @__attribute_mapping__ ||= {

            }
          end

          def element_mapping
            @__element_mapping__ ||= {
              citation: ClinVar::RDF::Model::TypeCitation,
              x_ref: ClinVar::RDF::Model::TypeXref
            }
          end
        end

        include ModelHelper

        attr_accessor :simple_allele
        attr_accessor :haplotype
        attr_accessor :submitted_interpretation_list
        attr_accessor :interpreted_variation_list
        attr_accessor :general_citations

        def initialize(simple_allele = nil, haplotype = nil, submitted_interpretation_list = nil, interpreted_variation_list = nil, general_citations = [])
          @simple_allele = simple_allele
          @haplotype = haplotype
          @submitted_interpretation_list = submitted_interpretation_list
          @interpreted_variation_list = interpreted_variation_list
          @general_citations = general_citations
        end

        def attribute_mapping
          @__attribute_mapping__ ||= {

          }
        end

        def element_mapping
          @__element_mapping__ ||= {
            simple_allele: ClinVar::RDF::Model::TypeAllele,
            haplotype: ClinVar::RDF::Model::TypeHaplotype,
            submitted_interpretation_list: ClinVar::RDF::Model::IncludedRecord::SubmittedInterpretationList,
            interpreted_variation_list: ClinVar::RDF::Model::IncludedRecord::InterpretedVariationList,
            general_citations: ClinVar::RDF::Model::IncludedRecord::GeneralCitations
          }
        end
      end
    end
  end
end
