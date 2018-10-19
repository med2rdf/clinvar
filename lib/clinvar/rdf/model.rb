require 'xsd/qname'

module ClinVar; module RDF; module Model


# {}typeComment
#   xmlattr_DataSource - SOAP::SOAPString
#   xmlattr_Type - SOAP::SOAPString
class TypeComment < ::String
  AttrDataSource = XSD::QName.new(nil, "DataSource")
  AttrType = XSD::QName.new(nil, "Type")

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_DataSource
    __xmlattr[AttrDataSource]
  end

  def xmlattr_DataSource=(value)
    __xmlattr[AttrDataSource] = value
  end

  def xmlattr_Type
    __xmlattr[AttrType]
  end

  def xmlattr_Type=(value)
    __xmlattr[AttrType] = value
  end

  def initialize(*arg)
    super
    @__xmlattr = {}
  end
end

# {}typeHGVSExpression
#   nucleotideExpression - ClinVar::RDF::Model::TypeNucleotideSequenceExpression
#   proteinExpression - ClinVar::RDF::Model::TypeProteinSequenceExpression
#   molecularConsequence - ClinVar::RDF::Model::TypeXref
#   xmlattr_Type - SOAP::SOAPString
#   xmlattr_Assembly - (any)
class TypeHGVSExpression
  AttrAssembly = XSD::QName.new(nil, "Assembly")
  AttrType = XSD::QName.new(nil, "Type")

  attr_accessor :nucleotideExpression
  attr_accessor :proteinExpression
  attr_accessor :molecularConsequence

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Type
    __xmlattr[AttrType]
  end

  def xmlattr_Type=(value)
    __xmlattr[AttrType] = value
  end

  def xmlattr_Assembly
    __xmlattr[AttrAssembly]
  end

  def xmlattr_Assembly=(value)
    __xmlattr[AttrAssembly] = value
  end

  def initialize(nucleotideExpression = nil, proteinExpression = nil, molecularConsequence = nil)
    @nucleotideExpression = nucleotideExpression
    @proteinExpression = proteinExpression
    @molecularConsequence = molecularConsequence
    @__xmlattr = {}
  end
end

# {}typeHaplotype
#   simpleAllele - ClinVar::RDF::Model::TypeAllele
#   name - SOAP::SOAPString
#   variationType - ClinVar::RDF::Model::TypeHaplotypeVariationType
#   otherNameList - ClinVar::RDF::Model::TypeNames
#   hGVSlist - ClinVar::RDF::Model::TypeHaplotype::HGVSlist
#   interpretations - ClinVar::RDF::Model::TypeAggregatedInterpretationSet
#   functionalConsequence - ClinVar::RDF::Model::TypeFunctionalConsequence
#   xRefList - ClinVar::RDF::Model::TypeHaplotype::XRefList
#   comment - ClinVar::RDF::Model::TypeComment
#   xmlattr_VariationID - SOAP::SOAPInt
#   xmlattr_NumberOfCopies - SOAP::SOAPInt
class TypeHaplotype
  AttrNumberOfCopies = XSD::QName.new(nil, "NumberOfCopies")
  AttrVariationID = XSD::QName.new(nil, "VariationID")

  # inner class for member: HGVSlist
  # {}HGVSlist
  class HGVSlist < ::Array
  end

  # inner class for member: XRefList
  # {}XRefList
  class XRefList < ::Array
  end

  attr_accessor :simpleAllele
  attr_accessor :name
  attr_accessor :variationType
  attr_accessor :otherNameList
  attr_accessor :hGVSlist
  attr_accessor :interpretations
  attr_accessor :functionalConsequence
  attr_accessor :xRefList
  attr_accessor :comment

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_VariationID
    __xmlattr[AttrVariationID]
  end

  def xmlattr_VariationID=(value)
    __xmlattr[AttrVariationID] = value
  end

  def xmlattr_NumberOfCopies
    __xmlattr[AttrNumberOfCopies]
  end

  def xmlattr_NumberOfCopies=(value)
    __xmlattr[AttrNumberOfCopies] = value
  end

  def initialize(simpleAllele = [], name = nil, variationType = nil, otherNameList = nil, hGVSlist = nil, interpretations = nil, functionalConsequence = [], xRefList = nil, comment = [])
    @simpleAllele = simpleAllele
    @name = name
    @variationType = variationType
    @otherNameList = otherNameList
    @hGVSlist = hGVSlist
    @interpretations = interpretations
    @functionalConsequence = functionalConsequence
    @xRefList = xRefList
    @comment = comment
    @__xmlattr = {}
  end
end

# {}typeHaplotypeSCV
#   simpleAllele - ClinVar::RDF::Model::TypeAlleleSCV
#   name - SOAP::SOAPString
#   otherNameList - ClinVar::RDF::Model::TypeNames
#   interpretations - ClinVar::RDF::Model::TypeAggregatedInterpretationSet
#   functionalConsequence - ClinVar::RDF::Model::TypeFunctionalConsequence
#   xRefList - ClinVar::RDF::Model::TypeHaplotypeSCV::XRefList
#   citationList - ClinVar::RDF::Model::TypeHaplotypeSCV::CitationList
#   comment - ClinVar::RDF::Model::TypeComment
#   attributeSet - ClinVar::RDF::Model::TypeAttributeSet
#   xmlattr_VariationID - SOAP::SOAPInt
#   xmlattr_NumberOfCopies - SOAP::SOAPInt
class TypeHaplotypeSCV
  AttrNumberOfCopies = XSD::QName.new(nil, "NumberOfCopies")
  AttrVariationID = XSD::QName.new(nil, "VariationID")

  # inner class for member: XRefList
  # {}XRefList
  class XRefList < ::Array
  end

  # inner class for member: CitationList
  # {}CitationList
  class CitationList < ::Array
  end

  attr_accessor :simpleAllele
  attr_accessor :name
  attr_accessor :otherNameList
  attr_accessor :interpretations
  attr_accessor :functionalConsequence
  attr_accessor :xRefList
  attr_accessor :citationList
  attr_accessor :comment
  attr_accessor :attributeSet

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_VariationID
    __xmlattr[AttrVariationID]
  end

  def xmlattr_VariationID=(value)
    __xmlattr[AttrVariationID] = value
  end

  def xmlattr_NumberOfCopies
    __xmlattr[AttrNumberOfCopies]
  end

  def xmlattr_NumberOfCopies=(value)
    __xmlattr[AttrNumberOfCopies] = value
  end

  def initialize(simpleAllele = [], name = nil, otherNameList = nil, interpretations = nil, functionalConsequence = [], xRefList = nil, citationList = nil, comment = [], attributeSet = [])
    @simpleAllele = simpleAllele
    @name = name
    @otherNameList = otherNameList
    @interpretations = interpretations
    @functionalConsequence = functionalConsequence
    @xRefList = xRefList
    @citationList = citationList
    @comment = comment
    @attributeSet = attributeSet
    @__xmlattr = {}
  end
end

# {}typeAttribute
#   xmlattr_integerValue - SOAP::SOAPInt
#   xmlattr_dateValue - SOAP::SOAPDate
class TypeAttribute < ::String
  AttrDateValue = XSD::QName.new(nil, "dateValue")
  AttrIntegerValue = XSD::QName.new(nil, "integerValue")

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_integerValue
    __xmlattr[AttrIntegerValue]
  end

  def xmlattr_integerValue=(value)
    __xmlattr[AttrIntegerValue] = value
  end

  def xmlattr_dateValue
    __xmlattr[AttrDateValue]
  end

  def xmlattr_dateValue=(value)
    __xmlattr[AttrDateValue] = value
  end

  def initialize(*arg)
    super
    @__xmlattr = {}
  end
end

# {}typeAlleleDescr
#   name - SOAP::SOAPString
#   relativeOrientation - SOAP::SOAPString
#   zygosity - ClinVar::RDF::Model::TypeZygosity
#   clinicalSignificance - ClinVar::RDF::Model::ClinicalSignificanceType
class TypeAlleleDescr
  attr_accessor :name
  attr_accessor :relativeOrientation
  attr_accessor :zygosity
  attr_accessor :clinicalSignificance

  def initialize(name = nil, relativeOrientation = nil, zygosity = nil, clinicalSignificance = nil)
    @name = name
    @relativeOrientation = relativeOrientation
    @zygosity = zygosity
    @clinicalSignificance = clinicalSignificance
  end
end

# {}typeLocation
#   cytogeneticLocation - SOAP::SOAPString
#   sequenceLocation - ClinVar::RDF::Model::TypeLocation::SequenceLocation
#   geneLocation - SOAP::SOAPString
#   xRef - ClinVar::RDF::Model::TypeXref
class TypeLocation

  # inner class for member: SequenceLocation
  # {}SequenceLocation
  #   xmlattr_forDisplay - SOAP::SOAPBoolean
  #   xmlattr_Assembly - SOAP::SOAPString
  #   xmlattr_Chr - (any)
  #   xmlattr_Accession - SOAP::SOAPString
  #   xmlattr_outerStart - SOAP::SOAPNonNegativeInteger
  #   xmlattr_innerStart - SOAP::SOAPNonNegativeInteger
  #   xmlattr_start - SOAP::SOAPNonNegativeInteger
  #   xmlattr_stop - SOAP::SOAPPositiveInteger
  #   xmlattr_innerStop - SOAP::SOAPPositiveInteger
  #   xmlattr_outerStop - SOAP::SOAPPositiveInteger
  #   xmlattr_display_start - SOAP::SOAPNonNegativeInteger
  #   xmlattr_display_stop - SOAP::SOAPPositiveInteger
  #   xmlattr_Strand - SOAP::SOAPString
  #   xmlattr_variantLength - SOAP::SOAPPositiveInteger
  #   xmlattr_referenceAllele - SOAP::SOAPString
  #   xmlattr_alternateAllele - SOAP::SOAPString
  #   xmlattr_AssemblyAccessionVersion - SOAP::SOAPString
  #   xmlattr_AssemblyStatus - SOAP::SOAPString
  #   xmlattr_positionVCF - SOAP::SOAPNonNegativeInteger
  #   xmlattr_referenceAlleleVCF - SOAP::SOAPString
  #   xmlattr_alternateAlleleVCF - SOAP::SOAPString
  #   xmlattr_forDisplayLength - SOAP::SOAPBoolean
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

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_forDisplay
      __xmlattr[AttrForDisplay]
    end

    def xmlattr_forDisplay=(value)
      __xmlattr[AttrForDisplay] = value
    end

    def xmlattr_Assembly
      __xmlattr[AttrAssembly]
    end

    def xmlattr_Assembly=(value)
      __xmlattr[AttrAssembly] = value
    end

    def xmlattr_Chr
      __xmlattr[AttrChr]
    end

    def xmlattr_Chr=(value)
      __xmlattr[AttrChr] = value
    end

    def xmlattr_Accession
      __xmlattr[AttrAccession]
    end

    def xmlattr_Accession=(value)
      __xmlattr[AttrAccession] = value
    end

    def xmlattr_outerStart
      __xmlattr[AttrOuterStart]
    end

    def xmlattr_outerStart=(value)
      __xmlattr[AttrOuterStart] = value
    end

    def xmlattr_innerStart
      __xmlattr[AttrInnerStart]
    end

    def xmlattr_innerStart=(value)
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

    def xmlattr_innerStop
      __xmlattr[AttrInnerStop]
    end

    def xmlattr_innerStop=(value)
      __xmlattr[AttrInnerStop] = value
    end

    def xmlattr_outerStop
      __xmlattr[AttrOuterStop]
    end

    def xmlattr_outerStop=(value)
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

    def xmlattr_Strand
      __xmlattr[AttrStrand]
    end

    def xmlattr_Strand=(value)
      __xmlattr[AttrStrand] = value
    end

    def xmlattr_variantLength
      __xmlattr[AttrVariantLength]
    end

    def xmlattr_variantLength=(value)
      __xmlattr[AttrVariantLength] = value
    end

    def xmlattr_referenceAllele
      __xmlattr[AttrReferenceAllele]
    end

    def xmlattr_referenceAllele=(value)
      __xmlattr[AttrReferenceAllele] = value
    end

    def xmlattr_alternateAllele
      __xmlattr[AttrAlternateAllele]
    end

    def xmlattr_alternateAllele=(value)
      __xmlattr[AttrAlternateAllele] = value
    end

    def xmlattr_AssemblyAccessionVersion
      __xmlattr[AttrAssemblyAccessionVersion]
    end

    def xmlattr_AssemblyAccessionVersion=(value)
      __xmlattr[AttrAssemblyAccessionVersion] = value
    end

    def xmlattr_AssemblyStatus
      __xmlattr[AttrAssemblyStatus]
    end

    def xmlattr_AssemblyStatus=(value)
      __xmlattr[AttrAssemblyStatus] = value
    end

    def xmlattr_positionVCF
      __xmlattr[AttrPositionVCF]
    end

    def xmlattr_positionVCF=(value)
      __xmlattr[AttrPositionVCF] = value
    end

    def xmlattr_referenceAlleleVCF
      __xmlattr[AttrReferenceAlleleVCF]
    end

    def xmlattr_referenceAlleleVCF=(value)
      __xmlattr[AttrReferenceAlleleVCF] = value
    end

    def xmlattr_alternateAlleleVCF
      __xmlattr[AttrAlternateAlleleVCF]
    end

    def xmlattr_alternateAlleleVCF=(value)
      __xmlattr[AttrAlternateAlleleVCF] = value
    end

    def xmlattr_forDisplayLength
      __xmlattr[AttrForDisplayLength]
    end

    def xmlattr_forDisplayLength=(value)
      __xmlattr[AttrForDisplayLength] = value
    end

    def initialize
      @__xmlattr = {}
    end
  end

  attr_accessor :cytogeneticLocation
  attr_accessor :sequenceLocation
  attr_accessor :geneLocation
  attr_accessor :xRef

  def initialize(cytogeneticLocation = [], sequenceLocation = [], geneLocation = [], xRef = [])
    @cytogeneticLocation = cytogeneticLocation
    @sequenceLocation = sequenceLocation
    @geneLocation = geneLocation
    @xRef = xRef
  end
end

# {}typeAllele
#   geneList - ClinVar::RDF::Model::TypeAllele::GeneList
#   name - SOAP::SOAPString
#   variantType - SOAP::SOAPString
#   location - ClinVar::RDF::Model::TypeLocation
#   otherNameList - ClinVar::RDF::Model::TypeNames
#   proteinChange - SOAP::SOAPString
#   hGVSlist - ClinVar::RDF::Model::TypeAllele::HGVSlist
#   interpretations - ClinVar::RDF::Model::TypeAggregatedInterpretationSet
#   xRefList - ClinVar::RDF::Model::TypeAllele::XRefList
#   comment - ClinVar::RDF::Model::TypeComment
#   functionalConsequence - ClinVar::RDF::Model::TypeFunctionalConsequence
#   alleleFrequencyList - ClinVar::RDF::Model::TypeAllele::AlleleFrequencyList
#   globalMinorAlleleFrequency - ClinVar::RDF::Model::TypeAllele::GlobalMinorAlleleFrequency
#   suspectList - ClinVar::RDF::Model::TypeAllele::SuspectList
#   xmlattr_AlleleID - SOAP::SOAPInt
#   xmlattr_VariationID - SOAP::SOAPPositiveInteger
class TypeAllele
  AttrAlleleID = XSD::QName.new(nil, "AlleleID")
  AttrVariationID = XSD::QName.new(nil, "VariationID")

  # inner class for member: GeneList
  # {}GeneList
  #   gene - ClinVar::RDF::Model::TypeAllele::GeneList::Gene
  #   xmlattr_GeneCount - SOAP::SOAPInt
  class GeneList
    AttrGeneCount = XSD::QName.new(nil, "GeneCount")

    # inner class for member: Gene
    # {}Gene
    #   location - ClinVar::RDF::Model::TypeLocation
    #   oMIM - SOAP::SOAPPositiveInteger
    #   haploinsufficiency - ClinVar::RDF::Model::TypeAllele::GeneList::Gene::Haploinsufficiency
    #   triplosensitivity - ClinVar::RDF::Model::TypeAllele::GeneList::Gene::Triplosensitivity
    #   property - SOAP::SOAPString
    #   xmlattr_Symbol - (any)
    #   xmlattr_FullName - SOAP::SOAPString
    #   xmlattr_GeneID - SOAP::SOAPPositiveInteger
    #   xmlattr_HGNC_ID - SOAP::SOAPString
    #   xmlattr_Source - SOAP::SOAPString
    #   xmlattr_RelationshipType - SOAP::SOAPString
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
      #   xmlattr_ClinGen - SOAP::SOAPAnyURI
      class Haploinsufficiency < ::String
        AttrClinGen = XSD::QName.new(nil, "ClinGen")
        AttrLast_evaluated = XSD::QName.new(nil, "last_evaluated")

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_last_evaluated
          __xmlattr[AttrLast_evaluated]
        end

        def xmlattr_last_evaluated=(value)
          __xmlattr[AttrLast_evaluated] = value
        end

        def xmlattr_ClinGen
          __xmlattr[AttrClinGen]
        end

        def xmlattr_ClinGen=(value)
          __xmlattr[AttrClinGen] = value
        end

        def initialize(*arg)
          super
          @__xmlattr = {}
        end
      end

      # inner class for member: Triplosensitivity
      # {}Triplosensitivity
      #   xmlattr_last_evaluated - SOAP::SOAPDate
      #   xmlattr_ClinGen - SOAP::SOAPAnyURI
      class Triplosensitivity < ::String
        AttrClinGen = XSD::QName.new(nil, "ClinGen")
        AttrLast_evaluated = XSD::QName.new(nil, "last_evaluated")

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_last_evaluated
          __xmlattr[AttrLast_evaluated]
        end

        def xmlattr_last_evaluated=(value)
          __xmlattr[AttrLast_evaluated] = value
        end

        def xmlattr_ClinGen
          __xmlattr[AttrClinGen]
        end

        def xmlattr_ClinGen=(value)
          __xmlattr[AttrClinGen] = value
        end

        def initialize(*arg)
          super
          @__xmlattr = {}
        end
      end

      attr_accessor :location
      attr_accessor :oMIM
      attr_accessor :haploinsufficiency
      attr_accessor :triplosensitivity
      attr_accessor :property

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_Symbol
        __xmlattr[AttrC_Symbol]
      end

      def xmlattr_Symbol=(value)
        __xmlattr[AttrC_Symbol] = value
      end

      def xmlattr_FullName
        __xmlattr[AttrFullName]
      end

      def xmlattr_FullName=(value)
        __xmlattr[AttrFullName] = value
      end

      def xmlattr_GeneID
        __xmlattr[AttrGeneID]
      end

      def xmlattr_GeneID=(value)
        __xmlattr[AttrGeneID] = value
      end

      def xmlattr_HGNC_ID
        __xmlattr[AttrHGNC_ID]
      end

      def xmlattr_HGNC_ID=(value)
        __xmlattr[AttrHGNC_ID] = value
      end

      def xmlattr_Source
        __xmlattr[AttrSource]
      end

      def xmlattr_Source=(value)
        __xmlattr[AttrSource] = value
      end

      def xmlattr_RelationshipType
        __xmlattr[AttrRelationshipType]
      end

      def xmlattr_RelationshipType=(value)
        __xmlattr[AttrRelationshipType] = value
      end

      def initialize(location = nil, oMIM = [], haploinsufficiency = nil, triplosensitivity = nil, property = [])
        @location = location
        @oMIM = oMIM
        @haploinsufficiency = haploinsufficiency
        @triplosensitivity = triplosensitivity
        @property = property
        @__xmlattr = {}
      end
    end

    attr_accessor :gene

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_GeneCount
      __xmlattr[AttrGeneCount]
    end

    def xmlattr_GeneCount=(value)
      __xmlattr[AttrGeneCount] = value
    end

    def initialize(gene = [])
      @gene = gene
      @__xmlattr = {}
    end
  end

  # inner class for member: HGVSlist
  # {}HGVSlist
  class HGVSlist < ::Array
  end

  # inner class for member: XRefList
  # {}XRefList
  class XRefList < ::Array
  end

  # inner class for member: AlleleFrequencyList
  # {}AlleleFrequencyList
  class AlleleFrequencyList < ::Array

    # {}AlleleFrequency
    #   xmlattr_Value - SOAP::SOAPDouble
    #   xmlattr_Type - SOAP::SOAPString
    #   xmlattr_MinorAllele - SOAP::SOAPString
    #   xmlattr_URL - SOAP::SOAPAnyURI
    class AlleleFrequency
      AttrMinorAllele = XSD::QName.new(nil, "MinorAllele")
      AttrType = XSD::QName.new(nil, "Type")
      AttrURL = XSD::QName.new(nil, "URL")
      AttrValue = XSD::QName.new(nil, "Value")

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_Value
        __xmlattr[AttrValue]
      end

      def xmlattr_Value=(value)
        __xmlattr[AttrValue] = value
      end

      def xmlattr_Type
        __xmlattr[AttrType]
      end

      def xmlattr_Type=(value)
        __xmlattr[AttrType] = value
      end

      def xmlattr_MinorAllele
        __xmlattr[AttrMinorAllele]
      end

      def xmlattr_MinorAllele=(value)
        __xmlattr[AttrMinorAllele] = value
      end

      def xmlattr_URL
        __xmlattr[AttrURL]
      end

      def xmlattr_URL=(value)
        __xmlattr[AttrURL] = value
      end

      def initialize
        @__xmlattr = {}
      end
    end
  end

  # inner class for member: GlobalMinorAlleleFrequency
  # {}GlobalMinorAlleleFrequency
  #   xmlattr_Value - SOAP::SOAPDouble
  #   xmlattr_Type - SOAP::SOAPString
  #   xmlattr_MinorAllele - SOAP::SOAPString
  #   xmlattr_URL - SOAP::SOAPAnyURI
  class GlobalMinorAlleleFrequency
    AttrMinorAllele = XSD::QName.new(nil, "MinorAllele")
    AttrType = XSD::QName.new(nil, "Type")
    AttrURL = XSD::QName.new(nil, "URL")
    AttrValue = XSD::QName.new(nil, "Value")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Value
      __xmlattr[AttrValue]
    end

    def xmlattr_Value=(value)
      __xmlattr[AttrValue] = value
    end

    def xmlattr_Type
      __xmlattr[AttrType]
    end

    def xmlattr_Type=(value)
      __xmlattr[AttrType] = value
    end

    def xmlattr_MinorAllele
      __xmlattr[AttrMinorAllele]
    end

    def xmlattr_MinorAllele=(value)
      __xmlattr[AttrMinorAllele] = value
    end

    def xmlattr_URL
      __xmlattr[AttrURL]
    end

    def xmlattr_URL=(value)
      __xmlattr[AttrURL] = value
    end

    def initialize
      @__xmlattr = {}
    end
  end

  # inner class for member: SuspectList
  # {}SuspectList
  class SuspectList < ::Array

    # {}Suspect
    #   xRef - ClinVar::RDF::Model::TypeXref
    #   xmlattr_Value - SOAP::SOAPString
    class Suspect
      AttrValue = XSD::QName.new(nil, "Value")

      attr_accessor :xRef

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_Value
        __xmlattr[AttrValue]
      end

      def xmlattr_Value=(value)
        __xmlattr[AttrValue] = value
      end

      def initialize(xRef = [])
        @xRef = xRef
        @__xmlattr = {}
      end
    end
  end

  attr_accessor :geneList
  attr_accessor :name
  attr_accessor :variantType
  attr_accessor :location
  attr_accessor :otherNameList
  attr_accessor :proteinChange
  attr_accessor :hGVSlist
  attr_accessor :interpretations
  attr_accessor :xRefList
  attr_accessor :comment
  attr_accessor :functionalConsequence
  attr_accessor :alleleFrequencyList
  attr_accessor :globalMinorAlleleFrequency
  attr_accessor :suspectList

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_AlleleID
    __xmlattr[AttrAlleleID]
  end

  def xmlattr_AlleleID=(value)
    __xmlattr[AttrAlleleID] = value
  end

  def xmlattr_VariationID
    __xmlattr[AttrVariationID]
  end

  def xmlattr_VariationID=(value)
    __xmlattr[AttrVariationID] = value
  end

  def initialize(geneList = nil, name = nil, variantType = nil, location = nil, otherNameList = nil, proteinChange = [], hGVSlist = nil, interpretations = nil, xRefList = nil, comment = [], functionalConsequence = [], alleleFrequencyList = nil, globalMinorAlleleFrequency = nil, suspectList = nil)
    @geneList = geneList
    @name = name
    @variantType = variantType
    @location = location
    @otherNameList = otherNameList
    @proteinChange = proteinChange
    @hGVSlist = hGVSlist
    @interpretations = interpretations
    @xRefList = xRefList
    @comment = comment
    @functionalConsequence = functionalConsequence
    @alleleFrequencyList = alleleFrequencyList
    @globalMinorAlleleFrequency = globalMinorAlleleFrequency
    @suspectList = suspectList
    @__xmlattr = {}
  end
end

# {}typeAlleleSCV
#   geneList - ClinVar::RDF::Model::TypeAlleleSCV::GeneList
#   name - ClinVar::RDF::Model::TypeAlleleSCV::Name
#   variantType - SOAP::SOAPString
#   location - ClinVar::RDF::Model::TypeLocation
#   otherNameList - ClinVar::RDF::Model::TypeNames
#   proteinChange - SOAP::SOAPString
#   xRefList - ClinVar::RDF::Model::TypeAlleleSCV::XRefList
#   citationList - ClinVar::RDF::Model::TypeAlleleSCV::CitationList
#   comment - ClinVar::RDF::Model::TypeComment
#   molecularConsequenceList - ClinVar::RDF::Model::TypeAlleleSCV::MolecularConsequenceList
#   functionalConsequence - ClinVar::RDF::Model::TypeFunctionalConsequence
#   attributeSet - ClinVar::RDF::Model::TypeAttributeSet
#   xmlattr_AlleleID - SOAP::SOAPInt
class TypeAlleleSCV
  AttrAlleleID = XSD::QName.new(nil, "AlleleID")

  # inner class for member: GeneList
  # {}GeneList
  class GeneList < ::Array

    # {}Gene
    #   name - SOAP::SOAPString
    #   property - SOAP::SOAPString
    #   xRef - ClinVar::RDF::Model::TypeXref
    #   xmlattr_Symbol - (any)
    #   xmlattr_RelationshipType - SOAP::SOAPString
    class Gene
      AttrC_Symbol = XSD::QName.new(nil, "Symbol")
      AttrRelationshipType = XSD::QName.new(nil, "RelationshipType")

      attr_accessor :name
      attr_accessor :property
      attr_accessor :xRef

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_Symbol
        __xmlattr[AttrC_Symbol]
      end

      def xmlattr_Symbol=(value)
        __xmlattr[AttrC_Symbol] = value
      end

      def xmlattr_RelationshipType
        __xmlattr[AttrRelationshipType]
      end

      def xmlattr_RelationshipType=(value)
        __xmlattr[AttrRelationshipType] = value
      end

      def initialize(name = nil, property = [], xRef = [])
        @name = name
        @property = property
        @xRef = xRef
        @__xmlattr = {}
      end
    end
  end

  # inner class for member: Name
  # {}Name
  #   xmlattr_Type - SOAP::SOAPString
  class Name < ::String
    AttrType = XSD::QName.new(nil, "Type")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Type
      __xmlattr[AttrType]
    end

    def xmlattr_Type=(value)
      __xmlattr[AttrType] = value
    end

    def initialize(*arg)
      super
      @__xmlattr = {}
    end
  end

  # inner class for member: XRefList
  # {}XRefList
  class XRefList < ::Array
  end

  # inner class for member: CitationList
  # {}CitationList
  class CitationList < ::Array
  end

  # inner class for member: MolecularConsequenceList
  # {}MolecularConsequenceList
  class MolecularConsequenceList < ::Array

    # {}MolecularConsequence
    #   xRef - ClinVar::RDF::Model::TypeXref
    #   citation - ClinVar::RDF::Model::TypeCitation
    #   comment - ClinVar::RDF::Model::TypeComment
    #   xmlattr_RS - SOAP::SOAPPositiveInteger
    #   xmlattr_HGVS - SOAP::SOAPString
    #   xmlattr_SOid - SOAP::SOAPString
    #   xmlattr_Function - SOAP::SOAPString
    class MolecularConsequence
      AttrFunction = XSD::QName.new(nil, "Function")
      AttrHGVS = XSD::QName.new(nil, "HGVS")
      AttrRS = XSD::QName.new(nil, "RS")
      AttrSOid = XSD::QName.new(nil, "SOid")

      attr_accessor :xRef
      attr_accessor :citation
      attr_accessor :comment

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_RS
        __xmlattr[AttrRS]
      end

      def xmlattr_RS=(value)
        __xmlattr[AttrRS] = value
      end

      def xmlattr_HGVS
        __xmlattr[AttrHGVS]
      end

      def xmlattr_HGVS=(value)
        __xmlattr[AttrHGVS] = value
      end

      def xmlattr_SOid
        __xmlattr[AttrSOid]
      end

      def xmlattr_SOid=(value)
        __xmlattr[AttrSOid] = value
      end

      def xmlattr_Function
        __xmlattr[AttrFunction]
      end

      def xmlattr_Function=(value)
        __xmlattr[AttrFunction] = value
      end

      def initialize(xRef = [], citation = [], comment = [])
        @xRef = xRef
        @citation = citation
        @comment = comment
        @__xmlattr = {}
      end
    end
  end

  attr_accessor :geneList
  attr_accessor :name
  attr_accessor :variantType
  attr_accessor :location
  attr_accessor :otherNameList
  attr_accessor :proteinChange
  attr_accessor :xRefList
  attr_accessor :citationList
  attr_accessor :comment
  attr_accessor :molecularConsequenceList
  attr_accessor :functionalConsequence
  attr_accessor :attributeSet

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_AlleleID
    __xmlattr[AttrAlleleID]
  end

  def xmlattr_AlleleID=(value)
    __xmlattr[AttrAlleleID] = value
  end

  def initialize(geneList = nil, name = [], variantType = nil, location = nil, otherNameList = nil, proteinChange = [], xRefList = nil, citationList = nil, comment = [], molecularConsequenceList = nil, functionalConsequence = [], attributeSet = [])
    @geneList = geneList
    @name = name
    @variantType = variantType
    @location = location
    @otherNameList = otherNameList
    @proteinChange = proteinChange
    @xRefList = xRefList
    @citationList = citationList
    @comment = comment
    @molecularConsequenceList = molecularConsequenceList
    @functionalConsequence = functionalConsequence
    @attributeSet = attributeSet
    @__xmlattr = {}
  end
end

# {}typeGenotype
#   simpleAllele - ClinVar::RDF::Model::TypeAllele
#   haplotype - ClinVar::RDF::Model::TypeHaplotype
#   name - SOAP::SOAPString
#   variationType - ClinVar::RDF::Model::TypeVariationType
#   otherNameList - ClinVar::RDF::Model::TypeNames
#   hGVSlist - ClinVar::RDF::Model::TypeGenotype::HGVSlist
#   functionalConsequence - ClinVar::RDF::Model::TypeGenotype::FunctionalConsequence
#   interpretations - ClinVar::RDF::Model::TypeAggregatedInterpretationSet
#   xRefList - ClinVar::RDF::Model::TypeGenotype::XRefList
#   citationList - ClinVar::RDF::Model::TypeGenotype::CitationList
#   comment - ClinVar::RDF::Model::TypeComment
#   attributeSet - ClinVar::RDF::Model::TypeAttributeSet
#   xmlattr_VariationID - SOAP::SOAPInt
class TypeGenotype
  AttrVariationID = XSD::QName.new(nil, "VariationID")

  # inner class for member: HGVSlist
  # {}HGVSlist
  class HGVSlist < ::Array
  end

  # inner class for member: FunctionalConsequence
  # {}FunctionalConsequence
  #   xRef - ClinVar::RDF::Model::TypeXref
  #   citation - ClinVar::RDF::Model::TypeCitation
  #   comment - ClinVar::RDF::Model::TypeComment
  #   xmlattr_Value - SOAP::SOAPString
  class FunctionalConsequence
    AttrValue = XSD::QName.new(nil, "Value")

    attr_accessor :xRef
    attr_accessor :citation
    attr_accessor :comment

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Value
      __xmlattr[AttrValue]
    end

    def xmlattr_Value=(value)
      __xmlattr[AttrValue] = value
    end

    def initialize(xRef = [], citation = [], comment = [])
      @xRef = xRef
      @citation = citation
      @comment = comment
      @__xmlattr = {}
    end
  end

  # inner class for member: XRefList
  # {}XRefList
  class XRefList < ::Array
  end

  # inner class for member: CitationList
  # {}CitationList
  class CitationList < ::Array
  end

  attr_accessor :simpleAllele
  attr_accessor :haplotype
  attr_accessor :name
  attr_accessor :variationType
  attr_accessor :otherNameList
  attr_accessor :hGVSlist
  attr_accessor :functionalConsequence
  attr_accessor :interpretations
  attr_accessor :xRefList
  attr_accessor :citationList
  attr_accessor :comment
  attr_accessor :attributeSet

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_VariationID
    __xmlattr[AttrVariationID]
  end

  def xmlattr_VariationID=(value)
    __xmlattr[AttrVariationID] = value
  end

  def initialize(simpleAllele = [], haplotype = [], name = nil, variationType = nil, otherNameList = nil, hGVSlist = nil, functionalConsequence = [], interpretations = [], xRefList = nil, citationList = nil, comment = [], attributeSet = [])
    @simpleAllele = simpleAllele
    @haplotype = haplotype
    @name = name
    @variationType = variationType
    @otherNameList = otherNameList
    @hGVSlist = hGVSlist
    @functionalConsequence = functionalConsequence
    @interpretations = interpretations
    @xRefList = xRefList
    @citationList = citationList
    @comment = comment
    @attributeSet = attributeSet
    @__xmlattr = {}
  end
end

# {}typeXref
#   xmlattr_DB - SOAP::SOAPString
#   xmlattr_ID - SOAP::SOAPString
#   xmlattr_Type - SOAP::SOAPString
#   xmlattr_URL - SOAP::SOAPAnyURI
#   xmlattr_Status - SOAP::SOAPString
class TypeXref
  AttrDB = XSD::QName.new(nil, "DB")
  AttrID = XSD::QName.new(nil, "ID")
  AttrStatus = XSD::QName.new(nil, "Status")
  AttrType = XSD::QName.new(nil, "Type")
  AttrURL = XSD::QName.new(nil, "URL")

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_DB
    __xmlattr[AttrDB]
  end

  def xmlattr_DB=(value)
    __xmlattr[AttrDB] = value
  end

  def xmlattr_ID
    __xmlattr[AttrID]
  end

  def xmlattr_ID=(value)
    __xmlattr[AttrID] = value
  end

  def xmlattr_Type
    __xmlattr[AttrType]
  end

  def xmlattr_Type=(value)
    __xmlattr[AttrType] = value
  end

  def xmlattr_URL
    __xmlattr[AttrURL]
  end

  def xmlattr_URL=(value)
    __xmlattr[AttrURL] = value
  end

  def xmlattr_Status
    __xmlattr[AttrStatus]
  end

  def xmlattr_Status=(value)
    __xmlattr[AttrStatus] = value
  end

  def initialize
    @__xmlattr = {}
  end
end

# {}SubmitterType
#   xmlattr_SubmitterName - SOAP::SOAPString
#   xmlattr_OrgID - SOAP::SOAPPositiveInteger
#   xmlattr_OrganizationCategory - SOAP::SOAPString
#   xmlattr_OrgAbbreviation - SOAP::SOAPString
#   xmlattr_Type - SOAP::SOAPString
class SubmitterType
  AttrOrgAbbreviation = XSD::QName.new(nil, "OrgAbbreviation")
  AttrOrgID = XSD::QName.new(nil, "OrgID")
  AttrOrganizationCategory = XSD::QName.new(nil, "OrganizationCategory")
  AttrSubmitterName = XSD::QName.new(nil, "SubmitterName")
  AttrType = XSD::QName.new(nil, "Type")

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_SubmitterName
    __xmlattr[AttrSubmitterName]
  end

  def xmlattr_SubmitterName=(value)
    __xmlattr[AttrSubmitterName] = value
  end

  def xmlattr_OrgID
    __xmlattr[AttrOrgID]
  end

  def xmlattr_OrgID=(value)
    __xmlattr[AttrOrgID] = value
  end

  def xmlattr_OrganizationCategory
    __xmlattr[AttrOrganizationCategory]
  end

  def xmlattr_OrganizationCategory=(value)
    __xmlattr[AttrOrganizationCategory] = value
  end

  def xmlattr_OrgAbbreviation
    __xmlattr[AttrOrgAbbreviation]
  end

  def xmlattr_OrgAbbreviation=(value)
    __xmlattr[AttrOrgAbbreviation] = value
  end

  def xmlattr_Type
    __xmlattr[AttrType]
  end

  def xmlattr_Type=(value)
    __xmlattr[AttrType] = value
  end

  def initialize
    @__xmlattr = {}
  end
end

# {}typeNames
class TypeNames < ::Array

  # {}Name
  #   xmlattr_Type - SOAP::SOAPString
  class Name < ::String
    AttrType = XSD::QName.new(nil, "Type")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Type
      __xmlattr[AttrType]
    end

    def xmlattr_Type=(value)
      __xmlattr[AttrType] = value
    end

    def initialize(*arg)
      super
      @__xmlattr = {}
    end
  end
end

# {}typeEvidenceObservation
#   method - ClinVar::RDF::Model::TypeMethodRefs
#   modeOfInheritance - SOAP::SOAPString
#   citationList - ClinVar::RDF::Model::TypeEvidenceObservation::CitationList
#   description - ClinVar::RDF::Model::TypeComment
#   observedPhenotypes - ClinVar::RDF::Model::PhenotypeListDetailsType
#   indications - ClinVar::RDF::Model::IndicationListType
#   xmlattr_SubmitterName - SOAP::SOAPString
#   xmlattr_OrgID - SOAP::SOAPPositiveInteger
#   xmlattr_OrganizationCategory - SOAP::SOAPString
#   xmlattr_OrgAbbreviation - SOAP::SOAPString
#   xmlattr_Families - (any)
#   xmlattr_Individuals - (any)
#   xmlattr_Segregation - (any)
#   xmlattr_OtherGene - (any)
#   xmlattr_SameGene - (any)
#   xmlattr_Type - SOAP::SOAPString
#   xmlattr_AlleleFrequency - SOAP::SOAPString
#   xmlattr_AlleleOrigin - SOAP::SOAPString
#   xmlattr_AlleleOriginTimesObserved - SOAP::SOAPInt
#   xmlattr_Ethnicity - SOAP::SOAPString
#   xmlattr_GeographicOrigin - SOAP::SOAPString
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
  end

  attr_accessor :method
  attr_accessor :modeOfInheritance
  attr_accessor :citationList
  attr_accessor :description
  attr_accessor :observedPhenotypes
  attr_accessor :indications

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_SubmitterName
    __xmlattr[AttrSubmitterName]
  end

  def xmlattr_SubmitterName=(value)
    __xmlattr[AttrSubmitterName] = value
  end

  def xmlattr_OrgID
    __xmlattr[AttrOrgID]
  end

  def xmlattr_OrgID=(value)
    __xmlattr[AttrOrgID] = value
  end

  def xmlattr_OrganizationCategory
    __xmlattr[AttrOrganizationCategory]
  end

  def xmlattr_OrganizationCategory=(value)
    __xmlattr[AttrOrganizationCategory] = value
  end

  def xmlattr_OrgAbbreviation
    __xmlattr[AttrOrgAbbreviation]
  end

  def xmlattr_OrgAbbreviation=(value)
    __xmlattr[AttrOrgAbbreviation] = value
  end

  def xmlattr_Families
    __xmlattr[AttrFamilies]
  end

  def xmlattr_Families=(value)
    __xmlattr[AttrFamilies] = value
  end

  def xmlattr_Individuals
    __xmlattr[AttrIndividuals]
  end

  def xmlattr_Individuals=(value)
    __xmlattr[AttrIndividuals] = value
  end

  def xmlattr_Segregation
    __xmlattr[AttrSegregation]
  end

  def xmlattr_Segregation=(value)
    __xmlattr[AttrSegregation] = value
  end

  def xmlattr_OtherGene
    __xmlattr[AttrOtherGene]
  end

  def xmlattr_OtherGene=(value)
    __xmlattr[AttrOtherGene] = value
  end

  def xmlattr_SameGene
    __xmlattr[AttrSameGene]
  end

  def xmlattr_SameGene=(value)
    __xmlattr[AttrSameGene] = value
  end

  def xmlattr_Type
    __xmlattr[AttrType]
  end

  def xmlattr_Type=(value)
    __xmlattr[AttrType] = value
  end

  def xmlattr_AlleleFrequency
    __xmlattr[AttrAlleleFrequency]
  end

  def xmlattr_AlleleFrequency=(value)
    __xmlattr[AttrAlleleFrequency] = value
  end

  def xmlattr_AlleleOrigin
    __xmlattr[AttrAlleleOrigin]
  end

  def xmlattr_AlleleOrigin=(value)
    __xmlattr[AttrAlleleOrigin] = value
  end

  def xmlattr_AlleleOriginTimesObserved
    __xmlattr[AttrAlleleOriginTimesObserved]
  end

  def xmlattr_AlleleOriginTimesObserved=(value)
    __xmlattr[AttrAlleleOriginTimesObserved] = value
  end

  def xmlattr_Ethnicity
    __xmlattr[AttrEthnicity]
  end

  def xmlattr_Ethnicity=(value)
    __xmlattr[AttrEthnicity] = value
  end

  def xmlattr_GeographicOrigin
    __xmlattr[AttrGeographicOrigin]
  end

  def xmlattr_GeographicOrigin=(value)
    __xmlattr[AttrGeographicOrigin] = value
  end

  def initialize(method = [], modeOfInheritance = [], citationList = nil, description = [], observedPhenotypes = nil, indications = nil)
    @method = method
    @modeOfInheritance = modeOfInheritance
    @citationList = citationList
    @description = description
    @observedPhenotypes = observedPhenotypes
    @indications = indications
    @__xmlattr = {}
  end
end

# {}typeCitation
#   iD - ClinVar::RDF::Model::TypeCitation::ID
#   uRL - SOAP::SOAPAnyURI
#   citationText - SOAP::SOAPString
#   xmlattr_Type - SOAP::SOAPString
#   xmlattr_Abbrev - SOAP::SOAPString
class TypeCitation
  AttrAbbrev = XSD::QName.new(nil, "Abbrev")
  AttrType = XSD::QName.new(nil, "Type")

  # inner class for member: ID
  # {}ID
  #   xmlattr_Source - SOAP::SOAPString
  class ID < ::String
    AttrSource = XSD::QName.new(nil, "Source")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Source
      __xmlattr[AttrSource]
    end

    def xmlattr_Source=(value)
      __xmlattr[AttrSource] = value
    end

    def initialize(*arg)
      super
      @__xmlattr = {}
    end
  end

  attr_accessor :iD
  attr_accessor :uRL
  attr_accessor :citationText

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Type
    __xmlattr[AttrType]
  end

  def xmlattr_Type=(value)
    __xmlattr[AttrType] = value
  end

  def xmlattr_Abbrev
    __xmlattr[AttrAbbrev]
  end

  def xmlattr_Abbrev=(value)
    __xmlattr[AttrAbbrev] = value
  end

  def initialize(iD = [], uRL = nil, citationText = nil)
    @iD = iD
    @uRL = uRL
    @citationText = citationText
    @__xmlattr = {}
  end
end

# {}typeNucleotideSequenceExpression
#   expression - SOAP::SOAPString
#   xmlattr_sequenceType - SOAP::SOAPString
#   xmlattr_sequenceAccessionVersion - (any)
#   xmlattr_sequenceAccession - (any)
#   xmlattr_sequenceVersion - (any)
#   xmlattr_change - (any)
#   xmlattr_Assembly - (any)
#   xmlattr_Submitted - (any)
class TypeNucleotideSequenceExpression
  AttrAssembly = XSD::QName.new(nil, "Assembly")
  AttrChange = XSD::QName.new(nil, "change")
  AttrSequenceAccession = XSD::QName.new(nil, "sequenceAccession")
  AttrSequenceAccessionVersion = XSD::QName.new(nil, "sequenceAccessionVersion")
  AttrSequenceType = XSD::QName.new(nil, "sequenceType")
  AttrSequenceVersion = XSD::QName.new(nil, "sequenceVersion")
  AttrSubmitted = XSD::QName.new(nil, "Submitted")

  attr_accessor :expression

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_sequenceType
    __xmlattr[AttrSequenceType]
  end

  def xmlattr_sequenceType=(value)
    __xmlattr[AttrSequenceType] = value
  end

  def xmlattr_sequenceAccessionVersion
    __xmlattr[AttrSequenceAccessionVersion]
  end

  def xmlattr_sequenceAccessionVersion=(value)
    __xmlattr[AttrSequenceAccessionVersion] = value
  end

  def xmlattr_sequenceAccession
    __xmlattr[AttrSequenceAccession]
  end

  def xmlattr_sequenceAccession=(value)
    __xmlattr[AttrSequenceAccession] = value
  end

  def xmlattr_sequenceVersion
    __xmlattr[AttrSequenceVersion]
  end

  def xmlattr_sequenceVersion=(value)
    __xmlattr[AttrSequenceVersion] = value
  end

  def xmlattr_change
    __xmlattr[AttrChange]
  end

  def xmlattr_change=(value)
    __xmlattr[AttrChange] = value
  end

  def xmlattr_Assembly
    __xmlattr[AttrAssembly]
  end

  def xmlattr_Assembly=(value)
    __xmlattr[AttrAssembly] = value
  end

  def xmlattr_Submitted
    __xmlattr[AttrSubmitted]
  end

  def xmlattr_Submitted=(value)
    __xmlattr[AttrSubmitted] = value
  end

  def initialize(expression = nil)
    @expression = expression
    @__xmlattr = {}
  end
end

# {}typeProteinSequenceExpression
#   expression - SOAP::SOAPString
#   xmlattr_sequenceAccessionVersion - (any)
#   xmlattr_sequenceAccession - (any)
#   xmlattr_sequenceVersion - (any)
#   xmlattr_change - (any)
class TypeProteinSequenceExpression
  AttrChange = XSD::QName.new(nil, "change")
  AttrSequenceAccession = XSD::QName.new(nil, "sequenceAccession")
  AttrSequenceAccessionVersion = XSD::QName.new(nil, "sequenceAccessionVersion")
  AttrSequenceVersion = XSD::QName.new(nil, "sequenceVersion")

  attr_accessor :expression

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_sequenceAccessionVersion
    __xmlattr[AttrSequenceAccessionVersion]
  end

  def xmlattr_sequenceAccessionVersion=(value)
    __xmlattr[AttrSequenceAccessionVersion] = value
  end

  def xmlattr_sequenceAccession
    __xmlattr[AttrSequenceAccession]
  end

  def xmlattr_sequenceAccession=(value)
    __xmlattr[AttrSequenceAccession] = value
  end

  def xmlattr_sequenceVersion
    __xmlattr[AttrSequenceVersion]
  end

  def xmlattr_sequenceVersion=(value)
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
end

# {}PhenotypeListDetailsType
#   phenotype - ClinVar::RDF::Model::PhenotypeListDetailsType::Phenotype
#   phenotypeDetails - ClinVar::RDF::Model::PhenotypeListDetailsType::PhenotypeDetails
#   xmlattr_PhenotypeSetType - SOAP::SOAPString
class PhenotypeListDetailsType
  AttrPhenotypeSetType = XSD::QName.new(nil, "PhenotypeSetType")

  # inner class for member: Phenotype
  # {}Phenotype
  #   xRefList - ClinVar::RDF::Model::PhenotypeListDetailsType::Phenotype::XRefList
  #   xmlattr_Name - SOAP::SOAPString
  #   xmlattr_target_id - SOAP::SOAPInt
  #   xmlattr_AffectedStatus - SOAP::SOAPString
  class Phenotype
    AttrAffectedStatus = XSD::QName.new(nil, "AffectedStatus")
    AttrName = XSD::QName.new(nil, "Name")
    AttrTarget_id = XSD::QName.new(nil, "target_id")

    # inner class for member: XRefList
    # {}XRefList
    class XRefList < ::Array
    end

    attr_accessor :xRefList

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Name
      __xmlattr[AttrName]
    end

    def xmlattr_Name=(value)
      __xmlattr[AttrName] = value
    end

    def xmlattr_target_id
      __xmlattr[AttrTarget_id]
    end

    def xmlattr_target_id=(value)
      __xmlattr[AttrTarget_id] = value
    end

    def xmlattr_AffectedStatus
      __xmlattr[AttrAffectedStatus]
    end

    def xmlattr_AffectedStatus=(value)
      __xmlattr[AttrAffectedStatus] = value
    end

    def initialize(xRefList = nil)
      @xRefList = xRefList
      @__xmlattr = {}
    end
  end

  # inner class for member: PhenotypeDetails
  # {}PhenotypeDetails
  #   xRefList - ClinVar::RDF::Model::PhenotypeListDetailsType::PhenotypeDetails::XRefList
  #   xmlattr_SubmitterName - SOAP::SOAPString
  #   xmlattr_OrgID - SOAP::SOAPPositiveInteger
  #   xmlattr_OrganizationCategory - SOAP::SOAPString
  #   xmlattr_OrgAbbreviation - SOAP::SOAPString
  #   xmlattr_Type - SOAP::SOAPString
  #   xmlattr_PersonID - SOAP::SOAPString
  #   xmlattr_DateEvaluated - SOAP::SOAPDate
  #   xmlattr_PhenotypeName - SOAP::SOAPString
  #   xmlattr_AffectedStatus - SOAP::SOAPString
  #   xmlattr_LOINC - SOAP::SOAPString
  #   xmlattr_ObservedValue - SOAP::SOAPString
  #   xmlattr_Interpretation - SOAP::SOAPString
  #   xmlattr_SourceLaboratory - SOAP::SOAPString
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
    end

    attr_accessor :xRefList

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_SubmitterName
      __xmlattr[AttrSubmitterName]
    end

    def xmlattr_SubmitterName=(value)
      __xmlattr[AttrSubmitterName] = value
    end

    def xmlattr_OrgID
      __xmlattr[AttrOrgID]
    end

    def xmlattr_OrgID=(value)
      __xmlattr[AttrOrgID] = value
    end

    def xmlattr_OrganizationCategory
      __xmlattr[AttrOrganizationCategory]
    end

    def xmlattr_OrganizationCategory=(value)
      __xmlattr[AttrOrganizationCategory] = value
    end

    def xmlattr_OrgAbbreviation
      __xmlattr[AttrOrgAbbreviation]
    end

    def xmlattr_OrgAbbreviation=(value)
      __xmlattr[AttrOrgAbbreviation] = value
    end

    def xmlattr_Type
      __xmlattr[AttrType]
    end

    def xmlattr_Type=(value)
      __xmlattr[AttrType] = value
    end

    def xmlattr_PersonID
      __xmlattr[AttrPersonID]
    end

    def xmlattr_PersonID=(value)
      __xmlattr[AttrPersonID] = value
    end

    def xmlattr_DateEvaluated
      __xmlattr[AttrDateEvaluated]
    end

    def xmlattr_DateEvaluated=(value)
      __xmlattr[AttrDateEvaluated] = value
    end

    def xmlattr_PhenotypeName
      __xmlattr[AttrPhenotypeName]
    end

    def xmlattr_PhenotypeName=(value)
      __xmlattr[AttrPhenotypeName] = value
    end

    def xmlattr_AffectedStatus
      __xmlattr[AttrAffectedStatus]
    end

    def xmlattr_AffectedStatus=(value)
      __xmlattr[AttrAffectedStatus] = value
    end

    def xmlattr_LOINC
      __xmlattr[AttrLOINC]
    end

    def xmlattr_LOINC=(value)
      __xmlattr[AttrLOINC] = value
    end

    def xmlattr_ObservedValue
      __xmlattr[AttrObservedValue]
    end

    def xmlattr_ObservedValue=(value)
      __xmlattr[AttrObservedValue] = value
    end

    def xmlattr_Interpretation
      __xmlattr[AttrInterpretation]
    end

    def xmlattr_Interpretation=(value)
      __xmlattr[AttrInterpretation] = value
    end

    def xmlattr_SourceLaboratory
      __xmlattr[AttrSourceLaboratory]
    end

    def xmlattr_SourceLaboratory=(value)
      __xmlattr[AttrSourceLaboratory] = value
    end

    def initialize(xRefList = nil)
      @xRefList = xRefList
      @__xmlattr = {}
    end
  end

  attr_accessor :phenotype
  attr_accessor :phenotypeDetails

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_PhenotypeSetType
    __xmlattr[AttrPhenotypeSetType]
  end

  def xmlattr_PhenotypeSetType=(value)
    __xmlattr[AttrPhenotypeSetType] = value
  end

  def initialize(phenotype = [], phenotypeDetails = [])
    @phenotype = phenotype
    @phenotypeDetails = phenotypeDetails
    @__xmlattr = {}
  end
end

# {}IndicationListType
#   indication - ClinVar::RDF::Model::IndicationListType::Indication
#   xmlattr_PhenotypeSetType - SOAP::SOAPString
class IndicationListType
  AttrPhenotypeSetType = XSD::QName.new(nil, "PhenotypeSetType")

  # inner class for member: Indication
  # {}Indication
  #   xRefList - ClinVar::RDF::Model::IndicationListType::Indication::XRefList
  #   xmlattr_Name - SOAP::SOAPString
  #   xmlattr_target_id - SOAP::SOAPInt
  class Indication
    AttrName = XSD::QName.new(nil, "Name")
    AttrTarget_id = XSD::QName.new(nil, "target_id")

    # inner class for member: XRefList
    # {}XRefList
    class XRefList < ::Array
    end

    attr_accessor :xRefList

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Name
      __xmlattr[AttrName]
    end

    def xmlattr_Name=(value)
      __xmlattr[AttrName] = value
    end

    def xmlattr_target_id
      __xmlattr[AttrTarget_id]
    end

    def xmlattr_target_id=(value)
      __xmlattr[AttrTarget_id] = value
    end

    def initialize(xRefList = nil)
      @xRefList = xRefList
      @__xmlattr = {}
    end
  end

  attr_accessor :indication

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_PhenotypeSetType
    __xmlattr[AttrPhenotypeSetType]
  end

  def xmlattr_PhenotypeSetType=(value)
    __xmlattr[AttrPhenotypeSetType] = value
  end

  def initialize(indication = [])
    @indication = indication
    @__xmlattr = {}
  end
end

# {}PharmaType
class PharmaType < ::Array

  # {}DrugResponse
  #   phenotypeList - ClinVar::RDF::Model::PhenotypeListDetailsType
  #   xRefList - ClinVar::RDF::Model::PharmaType::DrugResponse::XRefList
  #   xmlattr_Name - SOAP::SOAPString
  #   xmlattr_target_id - SOAP::SOAPInt
  class DrugResponse
    AttrName = XSD::QName.new(nil, "Name")
    AttrTarget_id = XSD::QName.new(nil, "target_id")

    # inner class for member: XRefList
    # {}XRefList
    class XRefList < ::Array
    end

    attr_accessor :phenotypeList
    attr_accessor :xRefList

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Name
      __xmlattr[AttrName]
    end

    def xmlattr_Name=(value)
      __xmlattr[AttrName] = value
    end

    def xmlattr_target_id
      __xmlattr[AttrTarget_id]
    end

    def xmlattr_target_id=(value)
      __xmlattr[AttrTarget_id] = value
    end

    def initialize(phenotypeList = nil, xRefList = nil)
      @phenotypeList = phenotypeList
      @xRefList = xRefList
      @__xmlattr = {}
    end
  end
end

# {}typeMethodRefs
#   methodName - SOAP::SOAPString
#   xRef - ClinVar::RDF::Model::TypeXref
class TypeMethodRefs
  attr_accessor :methodName
  attr_accessor :xRef

  def initialize(methodName = nil, xRef = [])
    @methodName = methodName
    @xRef = xRef
  end
end

# {}typeSample
#   sampleDescription - ClinVar::RDF::Model::TypeSample::SampleDescription
#   origin - SOAP::SOAPString
#   ethnicity - SOAP::SOAPString
#   geographicOrigin - SOAP::SOAPString
#   tissue - SOAP::SOAPString
#   cellLine - SOAP::SOAPString
#   species - ClinVar::RDF::Model::TypeSample::Species
#   age - ClinVar::RDF::Model::TypeSample::Age
#   strain - SOAP::SOAPString
#   affectedStatus - SOAP::SOAPString
#   numberTested - SOAP::SOAPInt
#   numberMales - SOAP::SOAPInt
#   numberFemales - SOAP::SOAPInt
#   numberChrTested - SOAP::SOAPInt
#   gender - SOAP::SOAPString
#   familyData - ClinVar::RDF::Model::FamilyInfo
#   proband - SOAP::SOAPString
#   indication - ClinVar::RDF::Model::IndicationType
#   citation - ClinVar::RDF::Model::TypeCitation
#   xRef - ClinVar::RDF::Model::TypeXref
#   comment - ClinVar::RDF::Model::TypeComment
#   sourceType - SOAP::SOAPString
class TypeSample

  # inner class for member: SampleDescription
  # {}SampleDescription
  #   description - ClinVar::RDF::Model::TypeComment
  #   citation - ClinVar::RDF::Model::TypeCitation
  class SampleDescription
    attr_accessor :description
    attr_accessor :citation

    def initialize(description = nil, citation = nil)
      @description = description
      @citation = citation
    end
  end

  # inner class for member: Species
  # {}Species
  #   xmlattr_TaxonomyId - SOAP::SOAPInt
  class Species < ::String
    AttrTaxonomyId = XSD::QName.new(nil, "TaxonomyId")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_TaxonomyId
      __xmlattr[AttrTaxonomyId]
    end

    def xmlattr_TaxonomyId=(value)
      __xmlattr[AttrTaxonomyId] = value
    end

    def initialize(*arg)
      super
      @__xmlattr = {}
    end
  end

  # inner class for member: Age
  # {}Age
  #   xmlattr_age_unit - SOAP::SOAPString
  #   xmlattr_Type - SOAP::SOAPString
  class Age < ::String
    AttrAge_unit = XSD::QName.new(nil, "age_unit")
    AttrType = XSD::QName.new(nil, "Type")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_age_unit
      __xmlattr[AttrAge_unit]
    end

    def xmlattr_age_unit=(value)
      __xmlattr[AttrAge_unit] = value
    end

    def xmlattr_Type
      __xmlattr[AttrType]
    end

    def xmlattr_Type=(value)
      __xmlattr[AttrType] = value
    end

    def initialize(*arg)
      super
      @__xmlattr = {}
    end
  end

  attr_accessor :sampleDescription
  attr_accessor :origin
  attr_accessor :ethnicity
  attr_accessor :geographicOrigin
  attr_accessor :tissue
  attr_accessor :cellLine
  attr_accessor :species
  attr_accessor :age
  attr_accessor :strain
  attr_accessor :affectedStatus
  attr_accessor :numberTested
  attr_accessor :numberMales
  attr_accessor :numberFemales
  attr_accessor :numberChrTested
  attr_accessor :gender
  attr_accessor :familyData
  attr_accessor :proband
  attr_accessor :indication
  attr_accessor :citation
  attr_accessor :xRef
  attr_accessor :comment
  attr_accessor :sourceType

  def initialize(sampleDescription = nil, origin = nil, ethnicity = nil, geographicOrigin = nil, tissue = nil, cellLine = nil, species = nil, age = [], strain = nil, affectedStatus = nil, numberTested = nil, numberMales = nil, numberFemales = nil, numberChrTested = nil, gender = nil, familyData = nil, proband = nil, indication = nil, citation = [], xRef = [], comment = [], sourceType = nil)
    @sampleDescription = sampleDescription
    @origin = origin
    @ethnicity = ethnicity
    @geographicOrigin = geographicOrigin
    @tissue = tissue
    @cellLine = cellLine
    @species = species
    @age = age
    @strain = strain
    @affectedStatus = affectedStatus
    @numberTested = numberTested
    @numberMales = numberMales
    @numberFemales = numberFemales
    @numberChrTested = numberChrTested
    @gender = gender
    @familyData = familyData
    @proband = proband
    @indication = indication
    @citation = citation
    @xRef = xRef
    @comment = comment
    @sourceType = sourceType
  end
end

# {}FamilyInfo
#   familyHistory - SOAP::SOAPString
#   xmlattr_NumFamilies - SOAP::SOAPInt
#   xmlattr_NumFamiliesWithVariant - SOAP::SOAPInt
#   xmlattr_NumFamiliesWithSegregationObserved - SOAP::SOAPInt
#   xmlattr_PedigreeID - SOAP::SOAPString
#   xmlattr_SegregationObserved - SOAP::SOAPString
class FamilyInfo
  AttrNumFamilies = XSD::QName.new(nil, "NumFamilies")
  AttrNumFamiliesWithSegregationObserved = XSD::QName.new(nil, "NumFamiliesWithSegregationObserved")
  AttrNumFamiliesWithVariant = XSD::QName.new(nil, "NumFamiliesWithVariant")
  AttrPedigreeID = XSD::QName.new(nil, "PedigreeID")
  AttrSegregationObserved = XSD::QName.new(nil, "SegregationObserved")

  attr_accessor :familyHistory

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_NumFamilies
    __xmlattr[AttrNumFamilies]
  end

  def xmlattr_NumFamilies=(value)
    __xmlattr[AttrNumFamilies] = value
  end

  def xmlattr_NumFamiliesWithVariant
    __xmlattr[AttrNumFamiliesWithVariant]
  end

  def xmlattr_NumFamiliesWithVariant=(value)
    __xmlattr[AttrNumFamiliesWithVariant] = value
  end

  def xmlattr_NumFamiliesWithSegregationObserved
    __xmlattr[AttrNumFamiliesWithSegregationObserved]
  end

  def xmlattr_NumFamiliesWithSegregationObserved=(value)
    __xmlattr[AttrNumFamiliesWithSegregationObserved] = value
  end

  def xmlattr_PedigreeID
    __xmlattr[AttrPedigreeID]
  end

  def xmlattr_PedigreeID=(value)
    __xmlattr[AttrPedigreeID] = value
  end

  def xmlattr_SegregationObserved
    __xmlattr[AttrSegregationObserved]
  end

  def xmlattr_SegregationObserved=(value)
    __xmlattr[AttrSegregationObserved] = value
  end

  def initialize(familyHistory = nil)
    @familyHistory = familyHistory
    @__xmlattr = {}
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

  def initialize
    @__xmlattr = {}
  end
end

# {}typeSingleInterpretation
#   description - SOAP::SOAPString
#   explanation - ClinVar::RDF::Model::TypeComment
#   xRef - ClinVar::RDF::Model::TypeXref
#   citation - ClinVar::RDF::Model::TypeCitation
#   comment - ClinVar::RDF::Model::TypeComment
#   xmlattr_DateLastEvaluated - SOAP::SOAPDate
#   xmlattr_AlleleOrigin - SOAP::SOAPString
#   xmlattr_Type - SOAP::SOAPString
class TypeSingleInterpretation
  AttrAlleleOrigin = XSD::QName.new(nil, "AlleleOrigin")
  AttrDateLastEvaluated = XSD::QName.new(nil, "DateLastEvaluated")
  AttrType = XSD::QName.new(nil, "Type")

  attr_accessor :description
  attr_accessor :explanation
  attr_accessor :xRef
  attr_accessor :citation
  attr_accessor :comment

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_DateLastEvaluated
    __xmlattr[AttrDateLastEvaluated]
  end

  def xmlattr_DateLastEvaluated=(value)
    __xmlattr[AttrDateLastEvaluated] = value
  end

  def xmlattr_AlleleOrigin
    __xmlattr[AttrAlleleOrigin]
  end

  def xmlattr_AlleleOrigin=(value)
    __xmlattr[AttrAlleleOrigin] = value
  end

  def xmlattr_Type
    __xmlattr[AttrType]
  end

  def xmlattr_Type=(value)
    __xmlattr[AttrType] = value
  end

  def initialize(description = nil, explanation = nil, xRef = [], citation = [], comment = [])
    @description = description
    @explanation = explanation
    @xRef = xRef
    @citation = citation
    @comment = comment
    @__xmlattr = {}
  end
end

# {}typeAggregatedInterpretation
#   description - SOAP::SOAPString
#   explanation - ClinVar::RDF::Model::TypeComment
#   xRef - ClinVar::RDF::Model::TypeXref
#   citation - ClinVar::RDF::Model::TypeCitation
#   comment - ClinVar::RDF::Model::TypeComment
#   descriptionHistory - ClinVar::RDF::Model::TypeDescriptionHistory
#   conditionList - ClinVar::RDF::Model::TypeAggregatedInterpretation::ConditionList
#   xmlattr_DateLastEvaluated - SOAP::SOAPDate
#   xmlattr_AlleleOrigin - SOAP::SOAPString
#   xmlattr_Type - SOAP::SOAPString
#   xmlattr_NumberOfSubmitters - SOAP::SOAPNonNegativeInteger
#   xmlattr_NumberOfSubmissions - SOAP::SOAPNonNegativeInteger
class TypeAggregatedInterpretation < TypeSingleInterpretation
  AttrAlleleOrigin = XSD::QName.new(nil, "AlleleOrigin")
  AttrDateLastEvaluated = XSD::QName.new(nil, "DateLastEvaluated")
  AttrNumberOfSubmissions = XSD::QName.new(nil, "NumberOfSubmissions")
  AttrNumberOfSubmitters = XSD::QName.new(nil, "NumberOfSubmitters")
  AttrType = XSD::QName.new(nil, "Type")

  # inner class for member: ConditionList
  # {}ConditionList
  class ConditionList < ::Array
  end

  attr_accessor :description
  attr_accessor :explanation
  attr_accessor :xRef
  attr_accessor :citation
  attr_accessor :comment
  attr_accessor :descriptionHistory
  attr_accessor :conditionList

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_DateLastEvaluated
    __xmlattr[AttrDateLastEvaluated]
  end

  def xmlattr_DateLastEvaluated=(value)
    __xmlattr[AttrDateLastEvaluated] = value
  end

  def xmlattr_AlleleOrigin
    __xmlattr[AttrAlleleOrigin]
  end

  def xmlattr_AlleleOrigin=(value)
    __xmlattr[AttrAlleleOrigin] = value
  end

  def xmlattr_Type
    __xmlattr[AttrType]
  end

  def xmlattr_Type=(value)
    __xmlattr[AttrType] = value
  end

  def xmlattr_NumberOfSubmitters
    __xmlattr[AttrNumberOfSubmitters]
  end

  def xmlattr_NumberOfSubmitters=(value)
    __xmlattr[AttrNumberOfSubmitters] = value
  end

  def xmlattr_NumberOfSubmissions
    __xmlattr[AttrNumberOfSubmissions]
  end

  def xmlattr_NumberOfSubmissions=(value)
    __xmlattr[AttrNumberOfSubmissions] = value
  end

  def initialize(description = nil, explanation = nil, xRef = [], citation = [], comment = [], descriptionHistory = [], conditionList = nil)
    @description = description
    @explanation = explanation
    @xRef = xRef
    @citation = citation
    @comment = comment
    @descriptionHistory = descriptionHistory
    @conditionList = conditionList
    @__xmlattr = {}
  end
end

# {}typeAggregatedInterpretationSet
class TypeAggregatedInterpretationSet < ::Array
end

# {}typeDescriptionHistory
#   description - SOAP::SOAPString
#   xmlattr_Dated - SOAP::SOAPDate
class TypeDescriptionHistory
  AttrDated = XSD::QName.new(nil, "Dated")

  attr_accessor :description

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Dated
    __xmlattr[AttrDated]
  end

  def xmlattr_Dated=(value)
    __xmlattr[AttrDated] = value
  end

  def initialize(description = nil)
    @description = description
    @__xmlattr = {}
  end
end

# {}typeRCV
#   interpretedConditionList - ClinVar::RDF::Model::TypeRCV::InterpretedConditionList
#   replacedList - ClinVar::RDF::Model::TypeRCV::ReplacedList
#   xmlattr_Title - SOAP::SOAPString
#   xmlattr_DateLastEvaluated - SOAP::SOAPDate
#   xmlattr_Interpretation - SOAP::SOAPString
#   xmlattr_SubmissionCount - SOAP::SOAPPositiveInteger
#   xmlattr_ReviewStatus - SOAP::SOAPString
#   xmlattr_Accession - SOAP::SOAPString
#   xmlattr_Version - SOAP::SOAPInteger
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
  end

  # inner class for member: ReplacedList
  # {}ReplacedList
  class ReplacedList < ::Array
  end

  attr_accessor :interpretedConditionList
  attr_accessor :replacedList

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Title
    __xmlattr[AttrTitle]
  end

  def xmlattr_Title=(value)
    __xmlattr[AttrTitle] = value
  end

  def xmlattr_DateLastEvaluated
    __xmlattr[AttrDateLastEvaluated]
  end

  def xmlattr_DateLastEvaluated=(value)
    __xmlattr[AttrDateLastEvaluated] = value
  end

  def xmlattr_Interpretation
    __xmlattr[AttrInterpretation]
  end

  def xmlattr_Interpretation=(value)
    __xmlattr[AttrInterpretation] = value
  end

  def xmlattr_SubmissionCount
    __xmlattr[AttrSubmissionCount]
  end

  def xmlattr_SubmissionCount=(value)
    __xmlattr[AttrSubmissionCount] = value
  end

  def xmlattr_ReviewStatus
    __xmlattr[AttrReviewStatus]
  end

  def xmlattr_ReviewStatus=(value)
    __xmlattr[AttrReviewStatus] = value
  end

  def xmlattr_Accession
    __xmlattr[AttrAccession]
  end

  def xmlattr_Accession=(value)
    __xmlattr[AttrAccession] = value
  end

  def xmlattr_Version
    __xmlattr[AttrVersion]
  end

  def xmlattr_Version=(value)
    __xmlattr[AttrVersion] = value
  end

  def initialize(interpretedConditionList = nil, replacedList = nil)
    @interpretedConditionList = interpretedConditionList
    @replacedList = replacedList
    @__xmlattr = {}
  end
end

# {}typeSCV
#   xmlattr_Title - SOAP::SOAPString
#   xmlattr_Accession - SOAP::SOAPString
#   xmlattr_Version - SOAP::SOAPInteger
class TypeSCV
  AttrAccession = XSD::QName.new(nil, "Accession")
  AttrTitle = XSD::QName.new(nil, "Title")
  AttrVersion = XSD::QName.new(nil, "Version")

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Title
    __xmlattr[AttrTitle]
  end

  def xmlattr_Title=(value)
    __xmlattr[AttrTitle] = value
  end

  def xmlattr_Accession
    __xmlattr[AttrAccession]
  end

  def xmlattr_Accession=(value)
    __xmlattr[AttrAccession] = value
  end

  def xmlattr_Version
    __xmlattr[AttrVersion]
  end

  def xmlattr_Version=(value)
    __xmlattr[AttrVersion] = value
  end

  def initialize
    @__xmlattr = {}
  end
end

# {}typeFunctionalConsequence
#   xRef - ClinVar::RDF::Model::TypeXref
#   citation - ClinVar::RDF::Model::TypeCitation
#   comment - ClinVar::RDF::Model::TypeComment
#   xmlattr_Value - SOAP::SOAPString
class TypeFunctionalConsequence
  AttrValue = XSD::QName.new(nil, "Value")

  attr_accessor :xRef
  attr_accessor :citation
  attr_accessor :comment

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Value
    __xmlattr[AttrValue]
  end

  def xmlattr_Value=(value)
    __xmlattr[AttrValue] = value
  end

  def initialize(xRef = [], citation = [], comment = [])
    @xRef = xRef
    @citation = citation
    @comment = comment
    @__xmlattr = {}
  end
end

# {}VariationArchiveType
#   recordStatus - SOAP::SOAPString
#   replacedBy - ClinVar::RDF::Model::TypeRecordHistory
#   replacedList - ClinVar::RDF::Model::VariationArchiveType::ReplacedList
#   comment - ClinVar::RDF::Model::TypeComment
#   species - ClinVar::RDF::Model::VariationArchiveType::Species
#   interpretedRecord - ClinVar::RDF::Model::InterpretedRecord
#   includedRecord - ClinVar::RDF::Model::IncludedRecord
#   xmlattr_VariationID - SOAP::SOAPPositiveInteger
#   xmlattr_VariationName - SOAP::SOAPString
#   xmlattr_VariationType - SOAP::SOAPString
#   xmlattr_DateCreated - SOAP::SOAPDate
#   xmlattr_DateLastUpdated - SOAP::SOAPDate
#   xmlattr_Accession - SOAP::SOAPString
#   xmlattr_Version - SOAP::SOAPInt
#   xmlattr_NumberOfSubmitters - SOAP::SOAPNonNegativeInteger
#   xmlattr_NumberOfSubmissions - SOAP::SOAPNonNegativeInteger
#   xmlattr_RecordType - SOAP::SOAPString
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
  end

  # inner class for member: Species
  # {}Species
  #   xmlattr_TaxonomyId - SOAP::SOAPInt
  class Species < ::String
    AttrTaxonomyId = XSD::QName.new(nil, "TaxonomyId")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_TaxonomyId
      __xmlattr[AttrTaxonomyId]
    end

    def xmlattr_TaxonomyId=(value)
      __xmlattr[AttrTaxonomyId] = value
    end

    def initialize(*arg)
      super
      @__xmlattr = {}
    end
  end

  attr_accessor :recordStatus
  attr_accessor :replacedBy
  attr_accessor :replacedList
  attr_accessor :comment
  attr_accessor :species
  attr_accessor :interpretedRecord
  attr_accessor :includedRecord

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_VariationID
    __xmlattr[AttrVariationID]
  end

  def xmlattr_VariationID=(value)
    __xmlattr[AttrVariationID] = value
  end

  def xmlattr_VariationName
    __xmlattr[AttrVariationName]
  end

  def xmlattr_VariationName=(value)
    __xmlattr[AttrVariationName] = value
  end

  def xmlattr_VariationType
    __xmlattr[AttrVariationType]
  end

  def xmlattr_VariationType=(value)
    __xmlattr[AttrVariationType] = value
  end

  def xmlattr_DateCreated
    __xmlattr[AttrDateCreated]
  end

  def xmlattr_DateCreated=(value)
    __xmlattr[AttrDateCreated] = value
  end

  def xmlattr_DateLastUpdated
    __xmlattr[AttrDateLastUpdated]
  end

  def xmlattr_DateLastUpdated=(value)
    __xmlattr[AttrDateLastUpdated] = value
  end

  def xmlattr_Accession
    __xmlattr[AttrAccession]
  end

  def xmlattr_Accession=(value)
    __xmlattr[AttrAccession] = value
  end

  def xmlattr_Version
    __xmlattr[AttrVersion]
  end

  def xmlattr_Version=(value)
    __xmlattr[AttrVersion] = value
  end

  def xmlattr_NumberOfSubmitters
    __xmlattr[AttrNumberOfSubmitters]
  end

  def xmlattr_NumberOfSubmitters=(value)
    __xmlattr[AttrNumberOfSubmitters] = value
  end

  def xmlattr_NumberOfSubmissions
    __xmlattr[AttrNumberOfSubmissions]
  end

  def xmlattr_NumberOfSubmissions=(value)
    __xmlattr[AttrNumberOfSubmissions] = value
  end

  def xmlattr_RecordType
    __xmlattr[AttrRecordType]
  end

  def xmlattr_RecordType=(value)
    __xmlattr[AttrRecordType] = value
  end

  def initialize(recordStatus = nil, replacedBy = nil, replacedList = nil, comment = nil, species = nil, interpretedRecord = nil, includedRecord = nil)
    @recordStatus = recordStatus
    @replacedBy = replacedBy
    @replacedList = replacedList
    @comment = comment
    @species = species
    @interpretedRecord = interpretedRecord
    @includedRecord = includedRecord
    @__xmlattr = {}
  end
end

# {}ReleaseType
#   variationArchive - ClinVar::RDF::Model::VariationArchiveType
#   xmlattr_ReleaseDate - SOAP::SOAPDate
class ReleaseType
  AttrReleaseDate = XSD::QName.new(nil, "ReleaseDate")

  attr_accessor :variationArchive

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_ReleaseDate
    __xmlattr[AttrReleaseDate]
  end

  def xmlattr_ReleaseDate=(value)
    __xmlattr[AttrReleaseDate] = value
  end

  def initialize(variationArchive = [])
    @variationArchive = variationArchive
    @__xmlattr = {}
  end
end

# {}Co-occurrenceType
#   zygosity - ClinVar::RDF::Model::TypeZygosity
#   alleleDescSet - ClinVar::RDF::Model::TypeAlleleDescr
#   count - SOAP::SOAPInt
class CoOccurrenceType
  attr_accessor :zygosity
  attr_accessor :alleleDescSet
  attr_accessor :count

  def initialize(zygosity = nil, alleleDescSet = [], count = nil)
    @zygosity = zygosity
    @alleleDescSet = alleleDescSet
    @count = count
  end
end

# {}typeDeletedSCV
#   accession - ClinVar::RDF::Model::TypeDeletedSCV::Accession
#   description - SOAP::SOAPString
class TypeDeletedSCV

  # inner class for member: Accession
  # {}Accession
  #   xmlattr_Version - SOAP::SOAPNonNegativeInteger
  #   xmlattr_DateDeleted - SOAP::SOAPDate
  class Accession < ::String
    AttrDateDeleted = XSD::QName.new(nil, "DateDeleted")
    AttrVersion = XSD::QName.new(nil, "Version")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Version
      __xmlattr[AttrVersion]
    end

    def xmlattr_Version=(value)
      __xmlattr[AttrVersion] = value
    end

    def xmlattr_DateDeleted
      __xmlattr[AttrDateDeleted]
    end

    def xmlattr_DateDeleted=(value)
      __xmlattr[AttrDateDeleted] = value
    end

    def initialize(*arg)
      super
      @__xmlattr = {}
    end
  end

  attr_accessor :accession
  attr_accessor :description

  def initialize(accession = nil, description = nil)
    @accession = accession
    @description = description
  end
end

# {}MeasureTraitType
#   clinVarSubmissionID - ClinVar::RDF::Model::MeasureTraitType::ClinVarSubmissionID
#   clinVarAccession - ClinVar::RDF::Model::MeasureTraitType::ClinVarAccession
#   additionalSubmitters - ClinVar::RDF::Model::MeasureTraitType::AdditionalSubmitters
#   recordStatus - SOAP::SOAPString
#   replaces - SOAP::SOAPString
#   replacedList - ClinVar::RDF::Model::MeasureTraitType::ReplacedList
#   reviewStatus - ClinVar::RDF::Model::TypeSubmitterReviewStatusValue
#   interpretation - ClinVar::RDF::Model::TypeSingleInterpretation
#   customAssertionScore - ClinVar::RDF::Model::MeasureTraitType::CustomAssertionScore
#   assertion - ClinVar::RDF::Model::TypeAssertionTypeAttr
#   attributeSet - ClinVar::RDF::Model::MeasureTraitType::AttributeSet
#   observedInList - ClinVar::RDF::Model::MeasureTraitType::ObservedInList
#   simpleAllele - ClinVar::RDF::Model::TypeAlleleSCV
#   haplotype - ClinVar::RDF::Model::TypeHaplotypeSCV
#   genotype - ClinVar::RDF::Model::TypeGenotypeSCV
#   traitSet - ClinVar::RDF::Model::ClinAsserTraitSetType
#   citation - ClinVar::RDF::Model::TypeCitation
#   studyName - SOAP::SOAPString
#   studyDescription - SOAP::SOAPString
#   comment - ClinVar::RDF::Model::TypeComment
#   submissionNameList - ClinVar::RDF::Model::MeasureTraitType::SubmissionNameList
#   xmlattr_DateCreated - SOAP::SOAPDate
#   xmlattr_DateLastUpdated - SOAP::SOAPDate
#   xmlattr_SubmissionDate - SOAP::SOAPDate
#   xmlattr_ID - SOAP::SOAPPositiveInteger
class MeasureTraitType
  AttrDateCreated = XSD::QName.new(nil, "DateCreated")
  AttrDateLastUpdated = XSD::QName.new(nil, "DateLastUpdated")
  AttrID = XSD::QName.new(nil, "ID")
  AttrSubmissionDate = XSD::QName.new(nil, "SubmissionDate")

  # inner class for member: ClinVarSubmissionID
  # {}ClinVarSubmissionID
  #   xmlattr_localKey - SOAP::SOAPString
  #   xmlattr_title - SOAP::SOAPString
  #   xmlattr_localKeyIsSubmitted - (any)
  #   xmlattr_submittedAssembly - SOAP::SOAPString
  class ClinVarSubmissionID
    AttrLocalKey = XSD::QName.new(nil, "localKey")
    AttrLocalKeyIsSubmitted = XSD::QName.new(nil, "localKeyIsSubmitted")
    AttrSubmittedAssembly = XSD::QName.new(nil, "submittedAssembly")
    AttrTitle = XSD::QName.new(nil, "title")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_localKey
      __xmlattr[AttrLocalKey]
    end

    def xmlattr_localKey=(value)
      __xmlattr[AttrLocalKey] = value
    end

    def xmlattr_title
      __xmlattr[AttrTitle]
    end

    def xmlattr_title=(value)
      __xmlattr[AttrTitle] = value
    end

    def xmlattr_localKeyIsSubmitted
      __xmlattr[AttrLocalKeyIsSubmitted]
    end

    def xmlattr_localKeyIsSubmitted=(value)
      __xmlattr[AttrLocalKeyIsSubmitted] = value
    end

    def xmlattr_submittedAssembly
      __xmlattr[AttrSubmittedAssembly]
    end

    def xmlattr_submittedAssembly=(value)
      __xmlattr[AttrSubmittedAssembly] = value
    end

    def initialize
      @__xmlattr = {}
    end
  end

  # inner class for member: ClinVarAccession
  # {}ClinVarAccession
  #   xmlattr_Accession - SOAP::SOAPString
  #   xmlattr_Version - SOAP::SOAPInteger
  #   xmlattr_Type - SOAP::SOAPString
  #   xmlattr_SubmitterName - SOAP::SOAPString
  #   xmlattr_OrgID - SOAP::SOAPPositiveInteger
  #   xmlattr_OrganizationCategory - SOAP::SOAPString
  #   xmlattr_OrgAbbreviation - SOAP::SOAPString
  #   xmlattr_DateUpdated - SOAP::SOAPDate
  class ClinVarAccession
    AttrAccession = XSD::QName.new(nil, "Accession")
    AttrDateUpdated = XSD::QName.new(nil, "DateUpdated")
    AttrOrgAbbreviation = XSD::QName.new(nil, "OrgAbbreviation")
    AttrOrgID = XSD::QName.new(nil, "OrgID")
    AttrOrganizationCategory = XSD::QName.new(nil, "OrganizationCategory")
    AttrSubmitterName = XSD::QName.new(nil, "SubmitterName")
    AttrType = XSD::QName.new(nil, "Type")
    AttrVersion = XSD::QName.new(nil, "Version")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Accession
      __xmlattr[AttrAccession]
    end

    def xmlattr_Accession=(value)
      __xmlattr[AttrAccession] = value
    end

    def xmlattr_Version
      __xmlattr[AttrVersion]
    end

    def xmlattr_Version=(value)
      __xmlattr[AttrVersion] = value
    end

    def xmlattr_Type
      __xmlattr[AttrType]
    end

    def xmlattr_Type=(value)
      __xmlattr[AttrType] = value
    end

    def xmlattr_SubmitterName
      __xmlattr[AttrSubmitterName]
    end

    def xmlattr_SubmitterName=(value)
      __xmlattr[AttrSubmitterName] = value
    end

    def xmlattr_OrgID
      __xmlattr[AttrOrgID]
    end

    def xmlattr_OrgID=(value)
      __xmlattr[AttrOrgID] = value
    end

    def xmlattr_OrganizationCategory
      __xmlattr[AttrOrganizationCategory]
    end

    def xmlattr_OrganizationCategory=(value)
      __xmlattr[AttrOrganizationCategory] = value
    end

    def xmlattr_OrgAbbreviation
      __xmlattr[AttrOrgAbbreviation]
    end

    def xmlattr_OrgAbbreviation=(value)
      __xmlattr[AttrOrgAbbreviation] = value
    end

    def xmlattr_DateUpdated
      __xmlattr[AttrDateUpdated]
    end

    def xmlattr_DateUpdated=(value)
      __xmlattr[AttrDateUpdated] = value
    end

    def initialize
      @__xmlattr = {}
    end
  end

  # inner class for member: AdditionalSubmitters
  # {}AdditionalSubmitters
  class AdditionalSubmitters < ::Array
  end

  # inner class for member: ReplacedList
  # {}ReplacedList
  class ReplacedList < ::Array
  end

  # inner class for member: CustomAssertionScore
  # {}CustomAssertionScore
  #   citation - ClinVar::RDF::Model::TypeCitation
  #   xRef - ClinVar::RDF::Model::TypeXref
  #   xmlattr_Type - SOAP::SOAPString
  #   xmlattr_Value - SOAP::SOAPString
  class CustomAssertionScore
    AttrType = XSD::QName.new(nil, "Type")
    AttrValue = XSD::QName.new(nil, "Value")

    attr_accessor :citation
    attr_accessor :xRef

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Type
      __xmlattr[AttrType]
    end

    def xmlattr_Type=(value)
      __xmlattr[AttrType] = value
    end

    def xmlattr_Value
      __xmlattr[AttrValue]
    end

    def xmlattr_Value=(value)
      __xmlattr[AttrValue] = value
    end

    def initialize(citation = [], xRef = [])
      @citation = citation
      @xRef = xRef
      @__xmlattr = {}
    end
  end

  # inner class for member: AttributeSet
  # {}AttributeSet
  #   attribute - ClinVar::RDF::Model::MeasureTraitType::AttributeSet::Attribute
  #   citation - ClinVar::RDF::Model::TypeCitation
  #   xRef - ClinVar::RDF::Model::TypeXref
  #   comment - ClinVar::RDF::Model::TypeComment
  class AttributeSet

    # inner class for member: Attribute
    # {}Attribute
    #   xmlattr_Type - SOAP::SOAPString
    class Attribute < ::String
      AttrType = XSD::QName.new(nil, "Type")

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_Type
        __xmlattr[AttrType]
      end

      def xmlattr_Type=(value)
        __xmlattr[AttrType] = value
      end

      def initialize(*arg)
        super
        @__xmlattr = {}
      end
    end

    attr_accessor :attribute
    attr_accessor :citation
    attr_accessor :xRef
    attr_accessor :comment

    def initialize(attribute = nil, citation = [], xRef = [], comment = [])
      @attribute = attribute
      @citation = citation
      @xRef = xRef
      @comment = comment
    end
  end

  # inner class for member: ObservedInList
  # {}ObservedInList
  class ObservedInList < ::Array
  end

  # inner class for member: SubmissionNameList
  # {}SubmissionNameList
  class SubmissionNameList < ::Array
  end

  attr_accessor :clinVarSubmissionID
  attr_accessor :clinVarAccession
  attr_accessor :additionalSubmitters
  attr_accessor :recordStatus
  attr_accessor :replaces
  attr_accessor :replacedList
  attr_accessor :reviewStatus
  attr_accessor :interpretation
  attr_accessor :customAssertionScore
  attr_accessor :assertion
  attr_accessor :attributeSet
  attr_accessor :observedInList
  attr_accessor :simpleAllele
  attr_accessor :haplotype
  attr_accessor :genotype
  attr_accessor :traitSet
  attr_accessor :citation
  attr_accessor :studyName
  attr_accessor :studyDescription
  attr_accessor :comment
  attr_accessor :submissionNameList

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_DateCreated
    __xmlattr[AttrDateCreated]
  end

  def xmlattr_DateCreated=(value)
    __xmlattr[AttrDateCreated] = value
  end

  def xmlattr_DateLastUpdated
    __xmlattr[AttrDateLastUpdated]
  end

  def xmlattr_DateLastUpdated=(value)
    __xmlattr[AttrDateLastUpdated] = value
  end

  def xmlattr_SubmissionDate
    __xmlattr[AttrSubmissionDate]
  end

  def xmlattr_SubmissionDate=(value)
    __xmlattr[AttrSubmissionDate] = value
  end

  def xmlattr_ID
    __xmlattr[AttrID]
  end

  def xmlattr_ID=(value)
    __xmlattr[AttrID] = value
  end

  def initialize(clinVarSubmissionID = nil, clinVarAccession = nil, additionalSubmitters = nil, recordStatus = nil, replaces = [], replacedList = nil, reviewStatus = nil, interpretation = nil, customAssertionScore = [], assertion = nil, attributeSet = [], observedInList = nil, simpleAllele = nil, haplotype = nil, genotype = nil, traitSet = nil, citation = [], studyName = nil, studyDescription = nil, comment = [], submissionNameList = nil)
    @clinVarSubmissionID = clinVarSubmissionID
    @clinVarAccession = clinVarAccession
    @additionalSubmitters = additionalSubmitters
    @recordStatus = recordStatus
    @replaces = replaces
    @replacedList = replacedList
    @reviewStatus = reviewStatus
    @interpretation = interpretation
    @customAssertionScore = customAssertionScore
    @assertion = assertion
    @attributeSet = attributeSet
    @observedInList = observedInList
    @simpleAllele = simpleAllele
    @haplotype = haplotype
    @genotype = genotype
    @traitSet = traitSet
    @citation = citation
    @studyName = studyName
    @studyDescription = studyDescription
    @comment = comment
    @submissionNameList = submissionNameList
    @__xmlattr = {}
  end
end

# {}MethodType
#   namePlatform - SOAP::SOAPString
#   typePlatform - SOAP::SOAPString
#   purpose - SOAP::SOAPString
#   resultType - SOAP::SOAPString
#   minReported - SOAP::SOAPString
#   maxReported - SOAP::SOAPString
#   referenceStandard - SOAP::SOAPString
#   citation - ClinVar::RDF::Model::TypeCitation
#   xRef - ClinVar::RDF::Model::TypeXref
#   description - SOAP::SOAPString
#   software - ClinVar::RDF::Model::TypeSoftwareSet
#   sourceType - SOAP::SOAPString
#   methodType - ClinVar::RDF::Model::TypeMethodlist
#   methodAttribute - ClinVar::RDF::Model::MethodType::MethodAttribute
#   obsMethodAttribute - ClinVar::RDF::Model::MethodType::ObsMethodAttribute
class MethodType

  # inner class for member: MethodAttribute
  # {}MethodAttribute
  #   attribute - ClinVar::RDF::Model::MethodType::MethodAttribute::Attribute
  class MethodAttribute

    # inner class for member: Attribute
    # {}Attribute
    #   xmlattr_Type - SOAP::SOAPString
    class Attribute < ::String
      AttrType = XSD::QName.new(nil, "Type")

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_Type
        __xmlattr[AttrType]
      end

      def xmlattr_Type=(value)
        __xmlattr[AttrType] = value
      end

      def initialize(*arg)
        super
        @__xmlattr = {}
      end
    end

    attr_accessor :attribute

    def initialize(attribute = nil)
      @attribute = attribute
    end
  end

  # inner class for member: ObsMethodAttribute
  # {}ObsMethodAttribute
  #   attribute - ClinVar::RDF::Model::MethodType::ObsMethodAttribute::Attribute
  #   comment - ClinVar::RDF::Model::TypeComment
  class ObsMethodAttribute

    # inner class for member: Attribute
    # {}Attribute
    #   xmlattr_Type - SOAP::SOAPString
    class Attribute < ::String
      AttrType = XSD::QName.new(nil, "Type")

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_Type
        __xmlattr[AttrType]
      end

      def xmlattr_Type=(value)
        __xmlattr[AttrType] = value
      end

      def initialize(*arg)
        super
        @__xmlattr = {}
      end
    end

    attr_accessor :attribute
    attr_accessor :comment

    def initialize(attribute = nil, comment = [])
      @attribute = attribute
      @comment = comment
    end
  end

  attr_accessor :namePlatform
  attr_accessor :typePlatform
  attr_accessor :purpose
  attr_accessor :resultType
  attr_accessor :minReported
  attr_accessor :maxReported
  attr_accessor :referenceStandard
  attr_accessor :citation
  attr_accessor :xRef
  attr_accessor :description
  attr_accessor :software
  attr_accessor :sourceType
  attr_accessor :methodType
  attr_accessor :methodAttribute
  attr_accessor :obsMethodAttribute

  def initialize(namePlatform = nil, typePlatform = nil, purpose = nil, resultType = nil, minReported = nil, maxReported = nil, referenceStandard = nil, citation = [], xRef = [], description = nil, software = [], sourceType = nil, methodType = nil, methodAttribute = [], obsMethodAttribute = [])
    @namePlatform = namePlatform
    @typePlatform = typePlatform
    @purpose = purpose
    @resultType = resultType
    @minReported = minReported
    @maxReported = maxReported
    @referenceStandard = referenceStandard
    @citation = citation
    @xRef = xRef
    @description = description
    @software = software
    @sourceType = sourceType
    @methodType = methodType
    @methodAttribute = methodAttribute
    @obsMethodAttribute = obsMethodAttribute
  end
end

# {}ObservationSet
#   sample - ClinVar::RDF::Model::TypeSample
#   method - ClinVar::RDF::Model::ObservationSet::C_Method
#   observedData - ClinVar::RDF::Model::ObservationSet::ObservedData
#   co_occurrenceSet - ClinVar::RDF::Model::CoOccurrenceType
#   traitSet - ClinVar::RDF::Model::ClinAsserTraitSetType
#   citation - ClinVar::RDF::Model::TypeCitation
#   xRef - ClinVar::RDF::Model::TypeXref
#   comment - ClinVar::RDF::Model::TypeComment
class ObservationSet

  # inner class for member: Method
  # {}Method
  #   namePlatform - SOAP::SOAPString
  #   typePlatform - SOAP::SOAPString
  #   purpose - SOAP::SOAPString
  #   resultType - SOAP::SOAPString
  #   minReported - SOAP::SOAPString
  #   maxReported - SOAP::SOAPString
  #   referenceStandard - SOAP::SOAPString
  #   citation - ClinVar::RDF::Model::TypeCitation
  #   xRef - ClinVar::RDF::Model::TypeXref
  #   description - SOAP::SOAPString
  #   software - ClinVar::RDF::Model::TypeSoftwareSet
  #   sourceType - SOAP::SOAPString
  #   methodType - ClinVar::RDF::Model::TypeMethodlist
  #   methodAttribute - ClinVar::RDF::Model::ObservationSet::C_Method::MethodAttribute
  #   obsMethodAttribute - ClinVar::RDF::Model::ObservationSet::C_Method::ObsMethodAttribute
  #   type - SOAP::SOAPString
  class C_Method < MethodType

    # inner class for member: MethodAttribute
    # {}MethodAttribute
    #   attribute - ClinVar::RDF::Model::ObservationSet::C_Method::MethodAttribute::Attribute
    class MethodAttribute

      # inner class for member: Attribute
      # {}Attribute
      #   xmlattr_Type - SOAP::SOAPString
      class Attribute < ::String
        AttrType = XSD::QName.new(nil, "Type")

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_Type
          __xmlattr[AttrType]
        end

        def xmlattr_Type=(value)
          __xmlattr[AttrType] = value
        end

        def initialize(*arg)
          super
          @__xmlattr = {}
        end
      end

      attr_accessor :attribute

      def initialize(attribute = nil)
        @attribute = attribute
      end
    end

    # inner class for member: ObsMethodAttribute
    # {}ObsMethodAttribute
    #   attribute - ClinVar::RDF::Model::ObservationSet::C_Method::ObsMethodAttribute::Attribute
    #   comment - ClinVar::RDF::Model::TypeComment
    class ObsMethodAttribute

      # inner class for member: Attribute
      # {}Attribute
      #   xmlattr_Type - SOAP::SOAPString
      class Attribute < ::String
        AttrType = XSD::QName.new(nil, "Type")

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_Type
          __xmlattr[AttrType]
        end

        def xmlattr_Type=(value)
          __xmlattr[AttrType] = value
        end

        def initialize(*arg)
          super
          @__xmlattr = {}
        end
      end

      attr_accessor :attribute
      attr_accessor :comment

      def initialize(attribute = nil, comment = [])
        @attribute = attribute
        @comment = comment
      end
    end

    attr_accessor :namePlatform
    attr_accessor :typePlatform
    attr_accessor :purpose
    attr_accessor :resultType
    attr_accessor :minReported
    attr_accessor :maxReported
    attr_accessor :referenceStandard
    attr_accessor :citation
    attr_accessor :xRef
    attr_accessor :description
    attr_accessor :software
    attr_accessor :sourceType
    attr_accessor :methodType
    attr_accessor :methodAttribute
    attr_accessor :obsMethodAttribute
    attr_accessor :type

    def initialize(namePlatform = nil, typePlatform = nil, purpose = nil, resultType = nil, minReported = nil, maxReported = nil, referenceStandard = nil, citation = [], xRef = [], description = nil, software = [], sourceType = nil, methodType = nil, methodAttribute = [], obsMethodAttribute = [], type = nil)
      @namePlatform = namePlatform
      @typePlatform = typePlatform
      @purpose = purpose
      @resultType = resultType
      @minReported = minReported
      @maxReported = maxReported
      @referenceStandard = referenceStandard
      @citation = citation
      @xRef = xRef
      @description = description
      @software = software
      @sourceType = sourceType
      @methodType = methodType
      @methodAttribute = methodAttribute
      @obsMethodAttribute = obsMethodAttribute
      @type = type
    end
  end

  # inner class for member: ObservedData
  # {}ObservedData
  #   attribute - ClinVar::RDF::Model::ObservationSet::ObservedData::Attribute
  #   severity - ClinVar::RDF::Model::TypeSeverity
  #   citation - ClinVar::RDF::Model::TypeCitation
  #   xRef - ClinVar::RDF::Model::TypeXref
  #   comment - ClinVar::RDF::Model::TypeComment
  class ObservedData

    # inner class for member: Attribute
    # {}Attribute
    #   xmlattr_Type - SOAP::SOAPString
    class Attribute < ::String
      AttrType = XSD::QName.new(nil, "Type")

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_Type
        __xmlattr[AttrType]
      end

      def xmlattr_Type=(value)
        __xmlattr[AttrType] = value
      end

      def initialize(*arg)
        super
        @__xmlattr = {}
      end
    end

    attr_accessor :attribute
    attr_accessor :severity
    attr_accessor :citation
    attr_accessor :xRef
    attr_accessor :comment

    def initialize(attribute = nil, severity = nil, citation = [], xRef = [], comment = [])
      @attribute = attribute
      @severity = severity
      @citation = citation
      @xRef = xRef
      @comment = comment
    end
  end

  attr_accessor :sample
  attr_accessor :method
  attr_accessor :observedData
  attr_accessor :co_occurrenceSet
  attr_accessor :traitSet
  attr_accessor :citation
  attr_accessor :xRef
  attr_accessor :comment

  def initialize(sample = nil, method = [], observedData = [], co_occurrenceSet = [], traitSet = nil, citation = [], xRef = [], comment = [])
    @sample = sample
    @method = method
    @observedData = observedData
    @co_occurrenceSet = co_occurrenceSet
    @traitSet = traitSet
    @citation = citation
    @xRef = xRef
    @comment = comment
  end
end

# {}ClinAsserTraitSetType
#   trait - ClinVar::RDF::Model::ClinAsserTraitType
#   name - ClinVar::RDF::Model::SetElementSetType
#   symbol - ClinVar::RDF::Model::SetElementSetType
#   attributeSet - ClinVar::RDF::Model::ClinAsserTraitSetType::AttributeSet
#   citation - ClinVar::RDF::Model::TypeCitation
#   xRef - ClinVar::RDF::Model::TypeXref
#   comment - ClinVar::RDF::Model::TypeComment
#   xmlattr_Type - SOAP::SOAPString
#   xmlattr_DateLastEvaluated - SOAP::SOAPDate
#   xmlattr_ID - SOAP::SOAPPositiveInteger
class ClinAsserTraitSetType
  AttrDateLastEvaluated = XSD::QName.new(nil, "DateLastEvaluated")
  AttrID = XSD::QName.new(nil, "ID")
  AttrType = XSD::QName.new(nil, "Type")

  # inner class for member: AttributeSet
  # {}AttributeSet
  #   attribute - ClinVar::RDF::Model::ClinAsserTraitSetType::AttributeSet::Attribute
  #   citation - ClinVar::RDF::Model::TypeCitation
  #   xRef - ClinVar::RDF::Model::TypeXref
  #   comment - ClinVar::RDF::Model::TypeComment
  class AttributeSet

    # inner class for member: Attribute
    # {}Attribute
    #   xmlattr_Type - SOAP::SOAPString
    class Attribute < ::String
      AttrType = XSD::QName.new(nil, "Type")

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_Type
        __xmlattr[AttrType]
      end

      def xmlattr_Type=(value)
        __xmlattr[AttrType] = value
      end

      def initialize(*arg)
        super
        @__xmlattr = {}
      end
    end

    attr_accessor :attribute
    attr_accessor :citation
    attr_accessor :xRef
    attr_accessor :comment

    def initialize(attribute = nil, citation = [], xRef = [], comment = [])
      @attribute = attribute
      @citation = citation
      @xRef = xRef
      @comment = comment
    end
  end

  attr_accessor :trait
  attr_accessor :name
  attr_accessor :symbol
  attr_accessor :attributeSet
  attr_accessor :citation
  attr_accessor :xRef
  attr_accessor :comment

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Type
    __xmlattr[AttrType]
  end

  def xmlattr_Type=(value)
    __xmlattr[AttrType] = value
  end

  def xmlattr_DateLastEvaluated
    __xmlattr[AttrDateLastEvaluated]
  end

  def xmlattr_DateLastEvaluated=(value)
    __xmlattr[AttrDateLastEvaluated] = value
  end

  def xmlattr_ID
    __xmlattr[AttrID]
  end

  def xmlattr_ID=(value)
    __xmlattr[AttrID] = value
  end

  def initialize(trait = [], name = [], symbol = [], attributeSet = [], citation = [], xRef = [], comment = [])
    @trait = trait
    @name = name
    @symbol = symbol
    @attributeSet = attributeSet
    @citation = citation
    @xRef = xRef
    @comment = comment
    @__xmlattr = {}
  end
end

# {}ClinAsserTraitType
#   name - ClinVar::RDF::Model::SetElementSetType
#   symbol - ClinVar::RDF::Model::SetElementSetType
#   attributeSet - ClinVar::RDF::Model::ClinAsserTraitType::AttributeSet
#   traitRelationship - ClinVar::RDF::Model::ClinAsserTraitType::TraitRelationship
#   citation - ClinVar::RDF::Model::TypeCitation
#   xRef - ClinVar::RDF::Model::TypeXref
#   comment - ClinVar::RDF::Model::TypeComment
#   source - SOAP::SOAPString
#   xmlattr_Type - SOAP::SOAPString
#   xmlattr_ID - SOAP::SOAPPositiveInteger
class ClinAsserTraitType
  AttrID = XSD::QName.new(nil, "ID")
  AttrType = XSD::QName.new(nil, "Type")

  # inner class for member: AttributeSet
  # {}AttributeSet
  #   attribute - ClinVar::RDF::Model::ClinAsserTraitType::AttributeSet::Attribute
  #   citation - ClinVar::RDF::Model::TypeCitation
  #   xRef - ClinVar::RDF::Model::TypeXref
  #   comment - ClinVar::RDF::Model::TypeComment
  class AttributeSet

    # inner class for member: Attribute
    # {}Attribute
    #   xmlattr_Type - SOAP::SOAPString
    class Attribute < ::String
      AttrType = XSD::QName.new(nil, "Type")

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_Type
        __xmlattr[AttrType]
      end

      def xmlattr_Type=(value)
        __xmlattr[AttrType] = value
      end

      def initialize(*arg)
        super
        @__xmlattr = {}
      end
    end

    attr_accessor :attribute
    attr_accessor :citation
    attr_accessor :xRef
    attr_accessor :comment

    def initialize(attribute = nil, citation = [], xRef = [], comment = [])
      @attribute = attribute
      @citation = citation
      @xRef = xRef
      @comment = comment
    end
  end

  # inner class for member: TraitRelationship
  # {}TraitRelationship
  #   name - ClinVar::RDF::Model::SetElementSetType
  #   symbol - ClinVar::RDF::Model::SetElementSetType
  #   attributeSet - ClinVar::RDF::Model::ClinAsserTraitType::TraitRelationship::AttributeSet
  #   citation - ClinVar::RDF::Model::TypeCitation
  #   xRef - ClinVar::RDF::Model::TypeXref
  #   source - SOAP::SOAPString
  #   xmlattr_Type - SOAP::SOAPString
  class TraitRelationship
    AttrType = XSD::QName.new(nil, "Type")

    # inner class for member: AttributeSet
    # {}AttributeSet
    #   attribute - ClinVar::RDF::Model::ClinAsserTraitType::TraitRelationship::AttributeSet::Attribute
    #   citation - ClinVar::RDF::Model::TypeCitation
    #   xRef - ClinVar::RDF::Model::TypeXref
    #   comment - ClinVar::RDF::Model::TypeComment
    class AttributeSet

      # inner class for member: Attribute
      # {}Attribute
      #   xmlattr_Type - SOAP::SOAPString
      class Attribute < ::String
        AttrType = XSD::QName.new(nil, "Type")

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_Type
          __xmlattr[AttrType]
        end

        def xmlattr_Type=(value)
          __xmlattr[AttrType] = value
        end

        def initialize(*arg)
          super
          @__xmlattr = {}
        end
      end

      attr_accessor :attribute
      attr_accessor :citation
      attr_accessor :xRef
      attr_accessor :comment

      def initialize(attribute = nil, citation = [], xRef = [], comment = [])
        @attribute = attribute
        @citation = citation
        @xRef = xRef
        @comment = comment
      end
    end

    attr_accessor :name
    attr_accessor :symbol
    attr_accessor :attributeSet
    attr_accessor :citation
    attr_accessor :xRef
    attr_accessor :source

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Type
      __xmlattr[AttrType]
    end

    def xmlattr_Type=(value)
      __xmlattr[AttrType] = value
    end

    def initialize(name = [], symbol = [], attributeSet = [], citation = [], xRef = [], source = [])
      @name = name
      @symbol = symbol
      @attributeSet = attributeSet
      @citation = citation
      @xRef = xRef
      @source = source
      @__xmlattr = {}
    end
  end

  attr_accessor :name
  attr_accessor :symbol
  attr_accessor :attributeSet
  attr_accessor :traitRelationship
  attr_accessor :citation
  attr_accessor :xRef
  attr_accessor :comment
  attr_accessor :source

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Type
    __xmlattr[AttrType]
  end

  def xmlattr_Type=(value)
    __xmlattr[AttrType] = value
  end

  def xmlattr_ID
    __xmlattr[AttrID]
  end

  def xmlattr_ID=(value)
    __xmlattr[AttrID] = value
  end

  def initialize(name = [], symbol = [], attributeSet = [], traitRelationship = [], citation = [], xRef = [], comment = [], source = [])
    @name = name
    @symbol = symbol
    @attributeSet = attributeSet
    @traitRelationship = traitRelationship
    @citation = citation
    @xRef = xRef
    @comment = comment
    @source = source
    @__xmlattr = {}
  end
end

# {}SetElementSetType
#   elementValue - ClinVar::RDF::Model::SetElementSetType::ElementValue
#   citation - ClinVar::RDF::Model::TypeCitation
#   xRef - ClinVar::RDF::Model::TypeXref
#   comment - ClinVar::RDF::Model::TypeComment
class SetElementSetType

  # inner class for member: ElementValue
  # {}ElementValue
  #   xmlattr_Type - SOAP::SOAPString
  class ElementValue < ::String
    AttrType = XSD::QName.new(nil, "Type")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Type
      __xmlattr[AttrType]
    end

    def xmlattr_Type=(value)
      __xmlattr[AttrType] = value
    end

    def initialize(*arg)
      super
      @__xmlattr = {}
    end
  end

  attr_accessor :elementValue
  attr_accessor :citation
  attr_accessor :xRef
  attr_accessor :comment

  def initialize(elementValue = nil, citation = [], xRef = [], comment = [])
    @elementValue = elementValue
    @citation = citation
    @xRef = xRef
    @comment = comment
  end
end

# {}typeAttributeSet
#   attribute - ClinVar::RDF::Model::TypeAttributeSet::Attribute
#   citation - ClinVar::RDF::Model::TypeCitation
#   xRef - ClinVar::RDF::Model::TypeXref
#   comment - ClinVar::RDF::Model::TypeComment
class TypeAttributeSet

  # inner class for member: Attribute
  # {}Attribute
  #   xmlattr_Type - SOAP::SOAPString
  class Attribute < ::String
    AttrType = XSD::QName.new(nil, "Type")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Type
      __xmlattr[AttrType]
    end

    def xmlattr_Type=(value)
      __xmlattr[AttrType] = value
    end

    def initialize(*arg)
      super
      @__xmlattr = {}
    end
  end

  attr_accessor :attribute
  attr_accessor :citation
  attr_accessor :xRef
  attr_accessor :comment

  def initialize(attribute = nil, citation = [], xRef = [], comment = [])
    @attribute = attribute
    @citation = citation
    @xRef = xRef
    @comment = comment
  end
end

# {}IndicationType
#   trait - ClinVar::RDF::Model::ClinAsserTraitType
#   name - ClinVar::RDF::Model::SetElementSetType
#   symbol - ClinVar::RDF::Model::SetElementSetType
#   attributeSet - ClinVar::RDF::Model::TypeAttributeSet
#   citation - ClinVar::RDF::Model::TypeCitation
#   xRef - ClinVar::RDF::Model::TypeXref
#   comment - ClinVar::RDF::Model::TypeComment
#   xmlattr_Type - SOAP::SOAPString
#   xmlattr_ID - SOAP::SOAPPositiveInteger
class IndicationType
  AttrID = XSD::QName.new(nil, "ID")
  AttrType = XSD::QName.new(nil, "Type")

  attr_accessor :trait
  attr_accessor :name
  attr_accessor :symbol
  attr_accessor :attributeSet
  attr_accessor :citation
  attr_accessor :xRef
  attr_accessor :comment

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Type
    __xmlattr[AttrType]
  end

  def xmlattr_Type=(value)
    __xmlattr[AttrType] = value
  end

  def xmlattr_ID
    __xmlattr[AttrID]
  end

  def xmlattr_ID=(value)
    __xmlattr[AttrID] = value
  end

  def initialize(trait = [], name = [], symbol = [], attributeSet = [], citation = [], xRef = [], comment = nil)
    @trait = trait
    @name = name
    @symbol = symbol
    @attributeSet = attributeSet
    @citation = citation
    @xRef = xRef
    @comment = comment
    @__xmlattr = {}
  end
end

# {}ClinicalSignificanceType
#   reviewStatus - ClinVar::RDF::Model::TypeSubmitterReviewStatusValue
#   description - SOAP::SOAPString
#   explanation - ClinVar::RDF::Model::TypeComment
#   xRef - ClinVar::RDF::Model::TypeXref
#   citation - ClinVar::RDF::Model::TypeCitation
#   comment - ClinVar::RDF::Model::TypeComment
#   xmlattr_DateLastEvaluated - SOAP::SOAPDate
class ClinicalSignificanceType
  AttrDateLastEvaluated = XSD::QName.new(nil, "DateLastEvaluated")

  attr_accessor :reviewStatus
  attr_accessor :description
  attr_accessor :explanation
  attr_accessor :xRef
  attr_accessor :citation
  attr_accessor :comment

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_DateLastEvaluated
    __xmlattr[AttrDateLastEvaluated]
  end

  def xmlattr_DateLastEvaluated=(value)
    __xmlattr[AttrDateLastEvaluated] = value
  end

  def initialize(reviewStatus = nil, description = nil, explanation = nil, xRef = [], citation = [], comment = [])
    @reviewStatus = reviewStatus
    @description = description
    @explanation = explanation
    @xRef = xRef
    @citation = citation
    @comment = comment
    @__xmlattr = {}
  end
end

# {}typeRecordHistory
#   comment - ClinVar::RDF::Model::TypeComment
#   xmlattr_Accession - SOAP::SOAPString
#   xmlattr_Version - SOAP::SOAPNonNegativeInteger
#   xmlattr_DateChanged - SOAP::SOAPDate
#   xmlattr_VariationID - SOAP::SOAPNonNegativeInteger
class TypeRecordHistory
  AttrAccession = XSD::QName.new(nil, "Accession")
  AttrDateChanged = XSD::QName.new(nil, "DateChanged")
  AttrVariationID = XSD::QName.new(nil, "VariationID")
  AttrVersion = XSD::QName.new(nil, "Version")

  attr_accessor :comment

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_Accession
    __xmlattr[AttrAccession]
  end

  def xmlattr_Accession=(value)
    __xmlattr[AttrAccession] = value
  end

  def xmlattr_Version
    __xmlattr[AttrVersion]
  end

  def xmlattr_Version=(value)
    __xmlattr[AttrVersion] = value
  end

  def xmlattr_DateChanged
    __xmlattr[AttrDateChanged]
  end

  def xmlattr_DateChanged=(value)
    __xmlattr[AttrDateChanged] = value
  end

  def xmlattr_VariationID
    __xmlattr[AttrVariationID]
  end

  def xmlattr_VariationID=(value)
    __xmlattr[AttrVariationID] = value
  end

  def initialize(comment = nil)
    @comment = comment
    @__xmlattr = {}
  end
end

# {}typeGenotypeSCV
#   simpleAllele - ClinVar::RDF::Model::TypeAlleleSCV
#   haplotype - ClinVar::RDF::Model::TypeHaplotypeSCV
#   name - SOAP::SOAPString
#   variationType - ClinVar::RDF::Model::TypeVariationType
#   functionalConsequence - ClinVar::RDF::Model::TypeGenotypeSCV::FunctionalConsequence
#   interpretations - ClinVar::RDF::Model::TypeAggregatedInterpretationSet
#   xRefList - ClinVar::RDF::Model::TypeGenotypeSCV::XRefList
#   citationList - ClinVar::RDF::Model::TypeGenotypeSCV::CitationList
#   comment - ClinVar::RDF::Model::TypeComment
#   attributeSet - ClinVar::RDF::Model::TypeAttributeSet
#   xmlattr_VariationID - SOAP::SOAPInt
class TypeGenotypeSCV
  AttrVariationID = XSD::QName.new(nil, "VariationID")

  # inner class for member: FunctionalConsequence
  # {}FunctionalConsequence
  #   xRef - ClinVar::RDF::Model::TypeXref
  #   citation - ClinVar::RDF::Model::TypeCitation
  #   comment - ClinVar::RDF::Model::TypeComment
  #   xmlattr_Value - SOAP::SOAPString
  class FunctionalConsequence
    AttrValue = XSD::QName.new(nil, "Value")

    attr_accessor :xRef
    attr_accessor :citation
    attr_accessor :comment

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_Value
      __xmlattr[AttrValue]
    end

    def xmlattr_Value=(value)
      __xmlattr[AttrValue] = value
    end

    def initialize(xRef = [], citation = [], comment = [])
      @xRef = xRef
      @citation = citation
      @comment = comment
      @__xmlattr = {}
    end
  end

  # inner class for member: XRefList
  # {}XRefList
  class XRefList < ::Array
  end

  # inner class for member: CitationList
  # {}CitationList
  class CitationList < ::Array
  end

  attr_accessor :simpleAllele
  attr_accessor :haplotype
  attr_accessor :name
  attr_accessor :variationType
  attr_accessor :functionalConsequence
  attr_accessor :interpretations
  attr_accessor :xRefList
  attr_accessor :citationList
  attr_accessor :comment
  attr_accessor :attributeSet

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_VariationID
    __xmlattr[AttrVariationID]
  end

  def xmlattr_VariationID=(value)
    __xmlattr[AttrVariationID] = value
  end

  def initialize(simpleAllele = [], haplotype = [], name = nil, variationType = nil, functionalConsequence = [], interpretations = [], xRefList = nil, citationList = nil, comment = [], attributeSet = [])
    @simpleAllele = simpleAllele
    @haplotype = haplotype
    @name = name
    @variationType = variationType
    @functionalConsequence = functionalConsequence
    @interpretations = interpretations
    @xRefList = xRefList
    @citationList = citationList
    @comment = comment
    @attributeSet = attributeSet
    @__xmlattr = {}
  end
end

# {}typeRCVInterpretedCondition
#   xmlattr_DB - SOAP::SOAPString
#   xmlattr_ID - SOAP::SOAPString
class TypeRCVInterpretedCondition < ::String
  AttrDB = XSD::QName.new(nil, "DB")
  AttrID = XSD::QName.new(nil, "ID")

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_DB
    __xmlattr[AttrDB]
  end

  def xmlattr_DB=(value)
    __xmlattr[AttrDB] = value
  end

  def xmlattr_ID
    __xmlattr[AttrID]
  end

  def xmlattr_ID=(value)
    __xmlattr[AttrID] = value
  end

  def initialize(*arg)
    super
    @__xmlattr = {}
  end
end

# {}typeGeneVariant
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
class TypeSeverity < ::String
  Mild = new("mild")
  Moderate = new("moderate")
  Severe = new("severe")
end

# {}typeStatus
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
class TypeZygosity < ::String
  CompoundHeterozygote = new("CompoundHeterozygote")
  Hemizygote = new("Hemizygote")
  Homozygote = new("Homozygote")
  NotProvided = new("not provided")
  SingleHeterozygote = new("SingleHeterozygote")
end

# {}typeAssertionTypeAttr
class TypeAssertionTypeAttr < ::String
  ConfersResistance = new("confers resistance")
  ConfersSensitivity = new("confers sensitivity")
  VariantToNamedProtein = new("variant to named protein")
  VariationInModifierGeneToDisease = new("variation in modifier gene to disease")
  VariationToDisease = new("variation to disease")
  VariationToIncludedDisease = new("variation to included disease")
end

# {}typeAggregateReviewStatusValue
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
class TypeChromosomeStr < ::String
  MT = new("MT")
  PAR = new("PAR")
  Un = new("Un")
  X = new("X")
  Y = new("Y")
end

# {}typeChromosome
#  any of typeChromosomeNr typeChromosomeStr
class TypeChromosome < ::String
end

# {}typeCommentType
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
class TypeNucleotideSequence < ::String
  Coding = new("coding")
  Genomic = new("genomic")
  GenomicRefSeqGene = new("genomic, RefSeqGene")
  GenomicTopLevel = new("genomic, top-level")
  NonCoding = new("non-coding")
  Protein = new("protein")
end

# {}typeProteinSequence
class TypeProteinSequence < ::String
  Protein = new("protein")
end

# {}typePhenotypeSet
class TypePhenotypeSet < ::String
  Disease = new("Disease")
  DrugResponse = new("DrugResponse")
  Finding = new("Finding")
  PhenotypeInstruction = new("PhenotypeInstruction")
  TraitChoice = new("TraitChoice")
end

# {}typeVariationType
class TypeVariationType < ::String
  CompoundHeterozygote = new("CompoundHeterozygote")
  Diplotype = new("Diplotype")
end

# {}typeEvidencetype
class TypeEvidencetype < ::String
  Computational = new("Computational")
  Experimental = new("Experimental")
  Genetic = new("Genetic")
  Population = new("Population")
end

# {}typeInterpretation
class TypeInterpretation < ::String
  Association = new("Association")
  ClinicalSignificance = new("Clinical significance")
  FunctionalStatus = new("Functional status")
end

# {}typeMethodlist
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
class TypeHGVS < ::String
  Coding = new("coding")
  Genomic = new("genomic")
  GenomicTopLevel = new("genomic, top-level")
  NonCoding = new("non-coding")
  Protein = new("protein")
end

# {}typeHaplotypeVariationType
class TypeHaplotypeVariationType < ::String
  Haplotype = new("Haplotype")
  PhaseUnknown = new("Phase unknown")
  Variation = new("Variation")
end

# {}InterpretedRecord
#   simpleAllele - ClinVar::RDF::Model::TypeAllele
#   haplotype - ClinVar::RDF::Model::TypeHaplotype
#   genotype - ClinVar::RDF::Model::TypeGenotype
#   reviewStatus - ClinVar::RDF::Model::TypeAggregateReviewStatusValue
#   rCVList - ClinVar::RDF::Model::InterpretedRecord::RCVList
#   interpretations - ClinVar::RDF::Model::TypeAggregatedInterpretationSet
#   clinicalAssertionList - ClinVar::RDF::Model::InterpretedRecord::ClinicalAssertionList
#   traitMappingList - ClinVar::RDF::Model::InterpretedRecord::TraitMappingList
#   deletedSCVList - ClinVar::RDF::Model::InterpretedRecord::DeletedSCVList
#   generalCitations - ClinVar::RDF::Model::InterpretedRecord::GeneralCitations
class InterpretedRecord

  # inner class for member: RCVList
  # {}RCVList
  #   rCVAccession - ClinVar::RDF::Model::TypeRCV
  #   xmlattr_SubmissionCount - SOAP::SOAPPositiveInteger
  #   xmlattr_IndependentObservations - SOAP::SOAPPositiveInteger
  class RCVList
    AttrIndependentObservations = XSD::QName.new(nil, "IndependentObservations")
    AttrSubmissionCount = XSD::QName.new(nil, "SubmissionCount")

    attr_accessor :rCVAccession

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_SubmissionCount
      __xmlattr[AttrSubmissionCount]
    end

    def xmlattr_SubmissionCount=(value)
      __xmlattr[AttrSubmissionCount] = value
    end

    def xmlattr_IndependentObservations
      __xmlattr[AttrIndependentObservations]
    end

    def xmlattr_IndependentObservations=(value)
      __xmlattr[AttrIndependentObservations] = value
    end

    def initialize(rCVAccession = [])
      @rCVAccession = rCVAccession
      @__xmlattr = {}
    end
  end

  # inner class for member: ClinicalAssertionList
  # {}ClinicalAssertionList
  class ClinicalAssertionList < ::Array
  end

  # inner class for member: TraitMappingList
  # {}TraitMappingList
  class TraitMappingList < ::Array

    # {}TraitMapping
    #   medGen - ClinVar::RDF::Model::InterpretedRecord::TraitMappingList::TraitMapping::MedGen
    #   xmlattr_ClinicalAssertionID - SOAP::SOAPPositiveInteger
    #   xmlattr_TraitType - SOAP::SOAPString
    #   xmlattr_MappingType - SOAP::SOAPString
    #   xmlattr_MappingValue - SOAP::SOAPString
    #   xmlattr_MappingRef - SOAP::SOAPString
    class TraitMapping
      AttrClinicalAssertionID = XSD::QName.new(nil, "ClinicalAssertionID")
      AttrMappingRef = XSD::QName.new(nil, "MappingRef")
      AttrMappingType = XSD::QName.new(nil, "MappingType")
      AttrMappingValue = XSD::QName.new(nil, "MappingValue")
      AttrTraitType = XSD::QName.new(nil, "TraitType")

      # inner class for member: MedGen
      # {}MedGen
      #   xmlattr_Name - SOAP::SOAPString
      #   xmlattr_CUI - SOAP::SOAPString
      class MedGen
        AttrCUI = XSD::QName.new(nil, "CUI")
        AttrName = XSD::QName.new(nil, "Name")

        def __xmlattr
          @__xmlattr ||= {}
        end

        def xmlattr_Name
          __xmlattr[AttrName]
        end

        def xmlattr_Name=(value)
          __xmlattr[AttrName] = value
        end

        def xmlattr_CUI
          __xmlattr[AttrCUI]
        end

        def xmlattr_CUI=(value)
          __xmlattr[AttrCUI] = value
        end

        def initialize
          @__xmlattr = {}
        end
      end

      attr_accessor :medGen

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_ClinicalAssertionID
        __xmlattr[AttrClinicalAssertionID]
      end

      def xmlattr_ClinicalAssertionID=(value)
        __xmlattr[AttrClinicalAssertionID] = value
      end

      def xmlattr_TraitType
        __xmlattr[AttrTraitType]
      end

      def xmlattr_TraitType=(value)
        __xmlattr[AttrTraitType] = value
      end

      def xmlattr_MappingType
        __xmlattr[AttrMappingType]
      end

      def xmlattr_MappingType=(value)
        __xmlattr[AttrMappingType] = value
      end

      def xmlattr_MappingValue
        __xmlattr[AttrMappingValue]
      end

      def xmlattr_MappingValue=(value)
        __xmlattr[AttrMappingValue] = value
      end

      def xmlattr_MappingRef
        __xmlattr[AttrMappingRef]
      end

      def xmlattr_MappingRef=(value)
        __xmlattr[AttrMappingRef] = value
      end

      def initialize(medGen = nil)
        @medGen = medGen
        @__xmlattr = {}
      end
    end
  end

  # inner class for member: DeletedSCVList
  # {}DeletedSCVList
  class DeletedSCVList < ::Array
  end

  # inner class for member: GeneralCitations
  # {}GeneralCitations
  #   citation - ClinVar::RDF::Model::TypeCitation
  #   xRef - ClinVar::RDF::Model::TypeXref
  class GeneralCitations
    attr_accessor :citation
    attr_accessor :xRef

    def initialize(citation = [], xRef = [])
      @citation = citation
      @xRef = xRef
    end
  end

  attr_accessor :simpleAllele
  attr_accessor :haplotype
  attr_accessor :genotype
  attr_accessor :reviewStatus
  attr_accessor :rCVList
  attr_accessor :interpretations
  attr_accessor :clinicalAssertionList
  attr_accessor :traitMappingList
  attr_accessor :deletedSCVList
  attr_accessor :generalCitations

  def initialize(simpleAllele = nil, haplotype = nil, genotype = nil, reviewStatus = nil, rCVList = nil, interpretations = nil, clinicalAssertionList = nil, traitMappingList = nil, deletedSCVList = nil, generalCitations = [])
    @simpleAllele = simpleAllele
    @haplotype = haplotype
    @genotype = genotype
    @reviewStatus = reviewStatus
    @rCVList = rCVList
    @interpretations = interpretations
    @clinicalAssertionList = clinicalAssertionList
    @traitMappingList = traitMappingList
    @deletedSCVList = deletedSCVList
    @generalCitations = generalCitations
  end
end

# {}IncludedRecord
#   simpleAllele - ClinVar::RDF::Model::TypeAllele
#   haplotype - ClinVar::RDF::Model::TypeHaplotype
#   submittedInterpretationList - ClinVar::RDF::Model::IncludedRecord::SubmittedInterpretationList
#   interpretedVariationList - ClinVar::RDF::Model::IncludedRecord::InterpretedVariationList
#   generalCitations - ClinVar::RDF::Model::IncludedRecord::GeneralCitations
class IncludedRecord

  # inner class for member: SubmittedInterpretationList
  # {}SubmittedInterpretationList
  class SubmittedInterpretationList < ::Array
  end

  # inner class for member: InterpretedVariationList
  # {}InterpretedVariationList
  class InterpretedVariationList < ::Array

    # {}InterpretedVariation
    #   xmlattr_VariationID - SOAP::SOAPPositiveInteger
    #   xmlattr_Accession - SOAP::SOAPString
    #   xmlattr_Version - SOAP::SOAPInteger
    class InterpretedVariation
      AttrAccession = XSD::QName.new(nil, "Accession")
      AttrVariationID = XSD::QName.new(nil, "VariationID")
      AttrVersion = XSD::QName.new(nil, "Version")

      def __xmlattr
        @__xmlattr ||= {}
      end

      def xmlattr_VariationID
        __xmlattr[AttrVariationID]
      end

      def xmlattr_VariationID=(value)
        __xmlattr[AttrVariationID] = value
      end

      def xmlattr_Accession
        __xmlattr[AttrAccession]
      end

      def xmlattr_Accession=(value)
        __xmlattr[AttrAccession] = value
      end

      def xmlattr_Version
        __xmlattr[AttrVersion]
      end

      def xmlattr_Version=(value)
        __xmlattr[AttrVersion] = value
      end

      def initialize
        @__xmlattr = {}
      end
    end
  end

  # inner class for member: GeneralCitations
  # {}GeneralCitations
  #   citation - ClinVar::RDF::Model::TypeCitation
  #   xRef - ClinVar::RDF::Model::TypeXref
  class GeneralCitations
    attr_accessor :citation
    attr_accessor :xRef

    def initialize(citation = [], xRef = [])
      @citation = citation
      @xRef = xRef
    end
  end

  attr_accessor :simpleAllele
  attr_accessor :haplotype
  attr_accessor :submittedInterpretationList
  attr_accessor :interpretedVariationList
  attr_accessor :generalCitations

  def initialize(simpleAllele = nil, haplotype = nil, submittedInterpretationList = nil, interpretedVariationList = nil, generalCitations = [])
    @simpleAllele = simpleAllele
    @haplotype = haplotype
    @submittedInterpretationList = submittedInterpretationList
    @interpretedVariationList = interpretedVariationList
    @generalCitations = generalCitations
  end
end


end; end; end
