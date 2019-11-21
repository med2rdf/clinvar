require 'active_support'
require 'active_support/core_ext/string'
require 'rdf'
require 'rdf/vocab'

# Namespace for ClinVar
module ClinVar
  # Namespace for ClinVar::RDF
  module RDF
    # Namespace for ClinVar::RDF::Refiner
    module Refiner

      $gene_hash = Hash.new


      module InterpretedRecordRefine
        def to_rdf
          graph = super

         graph << [subject, ::RDF.type, SIO[:SIO_001122]]
         graph.query([subject, Vocab[:interpretation], nil]).each do |statement|
           graph << [subject, SIO[:SIO_000255], statement.object]
           graph << [statement.object, ::RDF.type, SIO[:SIO_000897]]
           graph.delete(statement)
         end
         graph.query([subject, Vocab[:simple_allele], nil]).each do |statement|
           graph << [subject, SIO[:SIO_000628], statement.object]
           graph.delete(statement)
         end

         # Model specific refinement for TraitMapping
          graph.query([nil, Vocab[:trait_mapping], nil]).each do |statement|
            graph << [ statement.subject, SIO[:SIO_000628], statement.object]
            graph.query([statement.object, nil, nil]).each do |data|
              case data.predicate
              when Vocab[:mapping_ref]
                graph << [data.subject, Vocab[:label_type], data.object]
              when Vocab[:mapping_value]
                graph << [data.subject, ::RDF::Vocab::RDFS.label, data.object]
              when Vocab[:trait_type]
                if data.object.to_s == "Disease"
                  graph << [data.subject, ::RDF.type, M2R[:Disease]]
                end
              when Vocab[:med_gen]
                graph << [data.subject, ::RDF::Vocab::DC.references, data.object]
                graph.query([data.object, nil, nil]).each do |refer|
                  case refer.predicate
                  when Vocab[:cui]
                    graph << [refer.subject, ::RDF::Vocab::DC.identifier, refer.object]
                    graph << [refer.subject, ::RDF::Vocab::DC.source, "MedGen"]
                    graph << [refer.subject, ::RDF.type, ::RDF::Vocab::BIBO.Webpage]
                    graph << [refer.subject, ::RDF::Vocab::RDFS.seeAlso, ::RDF::URI.new(NCBI_BASE + "medgen/" + refer.object.to_s)]
                  when Vocab[:name]
                    graph << [refer.subject, ::RDF::Vocab::RDFS.label, refer.object]
                  end
                  graph.delete(refer)
                end
              end
              if data.predicate != ::RDF.type
                graph.delete(data)
              end
            end
            graph.delete(statement)
          end

          graph
        end
        Model::InterpretedRecord.prepend self
      end

      # Attribute specific refinement for RCV accession
      module RCVAccessionInsert

        def to_rdf
          graph = super

          if xmlattr_accession.present?
            graph << [subject, ::RDF::Vocab::DC.identifier, xmlattr_accession]
            graph << [subject, ::RDF::Vocab::RDFS.seeAlso, ::RDF::URI.new(RCV_ID_BASE + xmlattr_accession)]
          end

          graph
        end

        Model::TypeRCV.prepend self
      end

      # Attribute specific refinement for SCV accession
      module SCVAccessionInsert

        def to_rdf
          graph = super

          if xmlattr_accession.present?
            graph << [subject, ::RDF::Vocab::DC.identifier, xmlattr_accession]
            graph << [subject, ::RDF::Vocab::RDFS.seeAlso, ::RDF::URI.new(SCV_ID_BASE + xmlattr_accession)]
          end

          graph
        end

        Model::TypeSCV.prepend self
        Model::MeasureTraitType::ClinVarAccession.prepend self
      end

      # Attribute specific refinement for VCV accession
      module VCVAccessionInsert

        def get_link(cid,cdb,label)
                case cdb
                when "ClinVar"
                  return ::RDF::URI.new(CLINVAR_ID_BASE + cid)
                when "dbVar"
                  return ::RDF::URI.new(NCBI_BASE + "dbvar/variants/" + cid)
                when "MedGen"
                  return ::RDF::URI.new(NCBI_BASE + "medgen/" + cid)
                when "MeSH"
                  return ::RDF::URI.new(MESH_BASE + "ui?ui=" + cid)
                when "OMIM"
                  return ::RDF::URI.new(OMIM_BASE + cid.gsub(/\..+$/,""))
                when "Orphanet"
                  return ::RDF::URI.new(ORPHA_BASE + cid)
                when "dbSNP"
                  return ::RDF::URI.new(NCBI_BASE + "snp/rs" + cid)
                when "UniProtKB"
                  return ::RDF::URI.new(UNIPROT_BASE + cid)
                when "Genetics Home Reference"
                  return ::RDF::URI.new(GHR_BASE + "condition/" + cid)
                when "Variation Ontology"
                  return ::RDF::URI.new(OBO_BASE + "VariO_" + cid)
                when "GeneReviews"
                  return ::RDF::URI.new(NCBI_BASE + "bookshelf/" + cid)
                when "Genetic Testing Registry (GTR)"
                  return ::RDF::URI.new(NCBI_BASE + "gtr/tests/" + cid)
                when "Tuberous sclerosis database (TSC2)"
                  return ::RDF::URI.new(TSC_BASE + "variants.php?select_db=TSC2&action=search_unique&search_Variant/DBID=" + cid)
                when "Office of Rare Diseases"
                  if label != nil
                    label = label.gsub(/ /,"-")
                    return ::RDF::URI.new(GARD_BASE + cid + "/" + label)
                  end
                end
                return nil
        end

        def to_rdf
          graph = super

          id = xmlattr_variation_id&.to_s || xmlattr_accession&.match(/VCV(\d+)/)&.[](1)

          if id.present?
            graph << [subject, ::RDF::Vocab::RDFS.seeAlso, ::RDF::URI.new(CLINVAR_ID_BASE + id)]
          end

          graph.query([nil, Vocab[:citation], nil]).each do |statement|
            graph <<[statement.subject, ::RDF::Vocab::DC.references, statement.object]
            graph.delete(statement)
          end

          graph.query([nil, Vocab[:x_ref], nil]).each do |statement|
            label = nil
            graph.query([statement.subject, ::RDF::Vocab::RDFS.label, nil]).each do |ev|
              label = ev.object.to_s
            end
            graph <<[statement.subject, ::RDF::Vocab::DC.references, statement.object]
            cid = nil
            cdb = nil
            graph.query([statement.object, nil, nil]).each do |data|
              case data.predicate
              when Vocab[:id]
                cid = data.object.to_s
                graph << [data.subject, ::RDF::Vocab::DC.identifier , data.object]
                if cdb != nil
                  ref = get_link(cid, cdb, label)
                  if ref != nil
                    graph << [data.subject, ::RDF::Vocab::RDFS.seeAlso, ref]
                  end
                end
                graph.delete(data)
              when Vocab[:db]
                cdb = data.object.to_s
                if cid != nil
                  ref = get_link(cid, cdb, label)
                  if ref != nil
                    graph << [data.subject, ::RDF::Vocab::RDFS.seeAlso, ref]
                  end
                end
                graph << [data.subject, ::RDF::Vocab::DC.source, data.object]
                graph.delete(data)
              when ::RDF.type
                graph << [data.subject, ::RDF.type, ::RDF::Vocab::BIBO.Webpage]
              end
            end
            graph.delete(statement)
          end

          graph.query([nil, Vocab[:molecular_consequence], nil]).each do |statement|
            graph.query([statement.object, nil, nil]).each do |data|
              case data.predicate
              when Vocab[:type]
                graph << [data.subject, ::RDF::Vocab::RDFS.label, data.object]
              when Vocab[:id]
                graph << [data.subject, ::RDF::Vocab::DC.identifier, data.object]
                graph << [data.subject, ::RDF::Vocab::RDFS.seeAlso, SO[data.object.to_s]]
              end
              graph.delete(data)
            end
          end

          graph.query([nil, Vocab[:trait_set], nil]).each do |lstatement|
            graph.query([lstatement.object,nil,nil]).each do |statement|
              case statement.predicate
              when Vocab[:trait]
                graph << [subject, M2R[:disease], statement.object]
              end
              graph.delete(statement)
            end
            graph.delete(lstatement)
          end

          # Model specific refinement for AttributeSet
          graph.query([nil,nil,Vocab[:Attribute]]).each do |statement|
            set_base = nil
            graph.query([nil,nil,statement.subject]).each do |setstatement|
              set_base = setstatement.subject
              graph.delete(setstatement)
            end
            ctype = nil
            cvalue = nil
            graph.query([statement.subject, nil, nil]).each do |data|
              case data.predicate
              when Vocab[:attribute]
                graph << [set_base, ::RDF::Vocab::RDFS.label, data.object]
              when Vocab[:type]
                graph << [set_base, Vocab[:label_type], data.object]
              end
              graph.delete(data)
            end
            graph.delete(statement)
          end

          graph.query([nil, Vocab[:type], "Disease"]).each do |statement|
            graph << [statement.subject, ::RDF.type, M2R[:Disease]]
          end

          graph
        end

        Model::VariationArchiveType.prepend self
        Model::TypeRecordHistory.prepend self
        Model::IncludedRecord::InterpretedVariationList::InterpretedVariation.prepend self
      end

      # Attribute specific refinement for Allele ID
      module TypeAlleleRefine

        def trans_gene(graph,statement)
              target = nil
              graph.query([statement.object, Vocab[:gene_id], nil]).each do |gstatement|
                target = gstatement.object
              end
              if target != nil
                graph.query([statement.object, nil, nil]).each do |gstatement|
                  if gstatement.predicate == Vocab[:gene_id]
                    graph << [subject, M2R[:gene], ::RDF::URI.new(NCBI_GENE_ID_BASE + gstatement.object.to_s)]
                  end
                  graph.delete(gstatement)
                end
              else
                graph << [subject, M2R[:gene], statement.object]
              end
        end

        def to_rdf
          graph = super

          graph << [subject, ::RDF.type, M2R[:Variation]]

          ref = []
          if (alt = graph.select { |s| s.predicate == Vocab[:alternate_allele_vcf] }.map { |s| s.object.to_s }.uniq).present?
            ref = graph.select { |s| s.predicate == Vocab[:reference_allele_vcf] }.map { |s| s.object.to_s }.uniq
          elsif (alt = graph.select { |s| s.predicate == Vocab[:alternate_allele] }.map { |s| s.object.to_s }.uniq).present?
            ref = graph.select { |s| s.predicate == Vocab[:reference_allele] }.map { |s| s.object.to_s }.uniq
          end

          alt.each do |x|
            graph << [subject, M2R[:alternative_allele], x]
          end
          ref.each do |x|
            graph << [subject, M2R[:reference_allele], x]
          end

          graph.query([nil,Vocab[:alternate_allele_vcf], nil]).each do |statement|
            graph.delete(statement)
          end
          graph.query([nil,Vocab[:reference_allele_vcf], nil]).each do |statement|
            graph.delete(statement)
          end
          graph.query([nil,Vocab[:alternate_allele], nil]).each do |statement|
            graph.delete(statement)
          end
          graph.query([nil,Vocab[:reference_allele], nil]).each do |statement|
            graph.delete(statement)
          end

          graph.query([nil,Vocab[:location],nil]).each do |lstatement|
            graph.query([lstatement.object, nil, nil]).each do |statement|
              case statement.predicate
              when Vocab[:sequence_location]
                graph << [lstatement.subject, FALDO[:location], statement.object]
              when ::RDF.type
                nil
              else
                graph << [lstatement.subject, statement.predicate, statement.object]
              end
              graph.delete(statement)
            end
            graph.delete(lstatement)
          end


          graph.query([nil, ::RDF.type, Vocab[:Gene]]).each do |statement|
            graph << [statement.subject, ::RDF.type, M2R[:Gene]]
          end

          if xmlattr_allele_id.present?
            graph << [subject, ::RDF::Vocab::DC.identifier, xmlattr_allele_id]
          end

          graph.query([subject, nil, nil]).each do |statement|
            if statement.predicate == Vocab[:gene]
              trans_gene(graph, statement)
              graph.delete(statement)
            end
          end
          graph.query([subject, Vocab[:gene_list], nil]).each do |glstatement|
            graph.query([glstatement.object, nil, nil]).each do |statement|
              if statement.predicate == Vocab[:gene]
                trans_gene(graph, statement)
              end
              graph.delete(statement)
            end
            graph.delete(glstatement)
          end

          graph
        end

        Model::TypeAllele.prepend self
        Model::TypeAlleleSCV.prepend self
      end

      # Model specific refinement for VariationArchiveType
      module VariationArchiveTypeRefine
        def subject(uri = nil)
          if uri.nil?
            @__subject__ ||= begin
              if uri.is_a?(::RDF::Node)
                uri
              else
                id = xmlattr_variation_id&.to_s || xmlattr_accession&.match(/VCV(\d+)/)&.[](1)
                ::RDF::URI.new(CLINVAR_ID_BASE + id)
              end
            end

            return @__subject__
          end

          super

          self
        end

        def to_rdf
          graph = super

          if xmlattr_variation_name.present?
            graph << [subject, ::RDF::RDFS.label, xmlattr_variation_name]
          end
          if xmlattr_date_created.present?
            graph << [subject, ::RDF::Vocab::DC.created, xmlattr_date_created]
          end
          if xmlattr_date_last_updated.present?
            graph << [subject, ::RDF::Vocab::DC.modified, xmlattr_date_last_updated]
          end

          graph
        end

        Model::VariationArchiveType.prepend self
      end

      # Model specific refinement for GeneRefine
      module GeneRefine

        def to_rdf
          graph = super

          if xmlattr_hgnc_id.present?
            graph << [subject, ::RDF::Vocab::RDFS.seeAlso, ::RDF::URI.new(HGNC_ID_BASE + xmlattr_hgnc_id)]
          end

          if xmlattr_gene_id.present?
            if $gene_hash.has_key?(xmlattr_gene_id)
              graph.query([nil, nil, nil]).each do |statement|
                if statement.predicate != Vocab[:gene_id]
                  graph.delete(statement)
                end
              end
            end
            $gene_hash[xmlattr_gene_id] = TRUE

            gene_node = ::RDF::URI.new(NCBI_GENE_ID_BASE + xmlattr_gene_id)
            graph.query([subject, nil, nil]).each do |statement|
              if (statement.predicate == Vocab[:hgnc_id])
                graph << [gene_node, ::RDF::Vocab::RDFS.seeAlso, ::RDF::URI.new(HGNC_ID_BASE + xmlattr_hgnc_id)]
              end
              graph << [gene_node, statement.predicate, statement.object]
              if statement.predicate != Vocab[:gene_id]
                graph.delete(statement)
              end
            end
          end

          graph
        end

        Model::TypeAllele::GeneList::Gene.prepend self
      end

      module TypeCitationRefine
        def to_rdf
          graph = super

          graph.query([subject, nil, nil]).each do |statement|
            case statement.predicate
            when Vocab[:id]
              cid = nil
              csource = nil
              graph.query([statement.object, nil, nil]).each do |data|
                if data.predicate == Vocab[:id]
                  cid = data.object
                  graph << [subject, ::RDF::Vocab::DC.identifier, cid]
                elsif data.predicate == Vocab[:source]
                  csource = data.object
                  graph << [subject, ::RDF::Vocab::DC.source, csource]
                end
                graph.delete(data)
              end
              graph << [subject, ::RDF.type, ::RDF::Vocab::BIBO.Article]
              if cid != nil
                case csource
                when "DOI"
                  graph << [subject, ::RDF::Vocab::RDFS.seeAlso, ::RDF::URI.new(DOI_BASE + cid.to_s)]
                else
                  graph << [subject, ::RDF::Vocab::RDFS.seeAlso, ::RDF::URI.new(NCBI_BASE + csource.to_s.downcase + "/" + cid.to_s)]
                end
              end
              graph.delete(statement)
            when Vocab[:abbrev]
              graph << [subject, PRISM[:publicationName], statement.object]
              graph.delete(statement)
            end
          end

          graph
        end
        Model::TypeCitation.prepend self
      end

      # Model specific refinement for TypeLocation::SequenceLocation
      module SequenceLocationRefine

        require 'clinvar/rdf/mappings'
        include Mappings

        def to_rdf
          graph = super

          start_val = xmlattr_start || xmlattr_display_start
          stop_val  = xmlattr_stop || xmlattr_display_stop

          check_positions
          if fazzy?
            append_fuzzy_positions(graph)
          elsif start_val == stop_val || (start_val.present? && stop_val.blank?)
            append_single_position(graph)
          else
            append_positions(graph)
          end

          graph.query([subject, nil, nil]).each do |statement|
            case statement.predicate
            when Vocab[:display_start]
              graph.delete(statement)
            when Vocab[:display_stop]
              graph.delete(statement)
            when Vocab[:start]
              graph.delete(statement)
            when Vocab[:stop]
              graph.delete(statement)
            when Vocab[:position_vcf]
              graph.delete(statement)
            end
          end

          graph
        end

        private

        def check_positions
          if (xmlattr_start.present? && xmlattr_display_start.present?) && xmlattr_start != xmlattr_display_start
            raise('start and display_start differs.')
          end
          if (xmlattr_stop.present? && xmlattr_display_stop.present?) && xmlattr_stop != xmlattr_display_stop
            raise('stop and display_stop differs.')
          end
        end

        def fazzy?
          [xmlattr_inner_start, xmlattr_inner_stop, xmlattr_outer_start, xmlattr_outer_stop].any?(&:present?)
        end

        def append_single_position(graph)
          graph << [subject, ::RDF.type, FALDO.ExactPosition]
          if xmlattr_strand == '+'
            graph << [subject, ::RDF.type, FALDO.ForwardStrandPosition]
          elsif xmlattr_strand == '-'
            graph << [subject, ::RDF.type, FALDO.ReverseStrandPosition]
          end

          start_val = xmlattr_start || xmlattr_display_start

          graph << [subject, ::RDF::Vocab::RDFS.label, "#{xmlattr_chr || '?'}:#{start_val || '?'}:#{xmlattr_assembly || '?'}"]
          if start_val.present?
            graph << [subject, FALDO.position, start_val.to_i]
          end
          if xmlattr_accession.present?
            graph << [subject, FALDO.reference, ::RDF::URI.new(REFSEQ_ID_BASE + xmlattr_accession)]

            if (hco = refseq2hco(xmlattr_accession, xmlattr_assembly))
              graph << [subject, FALDO.reference, hco]
            end
          end

          graph
        end

        def append_fuzzy_positions(graph)
          start_val = xmlattr_start || xmlattr_display_start
          stop_val  = xmlattr_stop || xmlattr_display_stop
          graph << [subject, ::RDF.type, FALDO.Region]
          if [xmlattr_inner_start, xmlattr_outer_start].any?
            append_fuzzy_position(graph, FALDO.begin, xmlattr_inner_start, xmlattr_outer_start)
          else
            append_position(graph, FALDO.begin, start_val.to_i)
          end
          if [xmlattr_inner_stop, xmlattr_outer_stop].any?
            append_fuzzy_position(graph, FALDO.end, xmlattr_inner_stop, xmlattr_outer_stop)
          else
            append_position(graph, FALDO.end, stop_val.to_i)
          end
        end

        def append_fuzzy_position(graph, property, inner, outer)
          if inner.present?
            append_position(graph, property, inner.to_i)
          end
          if outer.present?
            append_position(graph, property, outer.to_i)
          end
        end

        def append_positions(graph)
          start_val = xmlattr_start || xmlattr_display_start
          stop_val  = xmlattr_stop || xmlattr_display_stop
          graph << [subject, ::RDF.type, FALDO.Region]
          append_position(graph, FALDO.begin, start_val.to_i)
          append_position(graph, FALDO.end, stop_val.to_i)
        end

        def append_position(graph, property, position)
          graph << [subject, property, bn = ::RDF::Node.new]
          graph << [bn, ::RDF.type, FALDO.ExactPosition]
          if xmlattr_strand == '+'
            graph << [bn, ::RDF.type, FALDO.ForwardStrandPosition]
          elsif xmlattr_strand == '-'
            graph << [bn, ::RDF.type, FALDO.ReverseStrandPosition]
          end
          graph << [bn, FALDO.position, position.to_i]

          if xmlattr_accession.present?
            graph << [bn, FALDO.reference, ::RDF::URI.new(REFSEQ_ID_BASE + xmlattr_accession)]

            if (hco = refseq2hco(xmlattr_accession, xmlattr_assembly))
              graph << [bn, FALDO.reference, hco]
            end
          end
        end

        Model::TypeLocation::SequenceLocation.prepend self
      end

      # Model specific refinement for TypeRCVInterpretedCondition
      module TypeRCVInterpretedConditionRefine
        def to_rdf
          graph = super
          cid = nil
          cdb = nil
          graph.query([subject,nil,nil]).each do |statement|
            case statement.predicate
            when ::RDF.type
              graph << [subject, ::RDF.type, M2R[:Disease]]
              graph.delete(statement)
            when Vocab[:type_rcv_interpreted_condition]
              graph << [subject, ::RDF::Vocab::RDFS.label, statement.object]
              graph.delete(statement)
            when Vocab[:id]
              cid = statement.object.to_s
              if cdb == "MedGen"
                graph << [subject, ::RDF::Vocab::DC.references, ::RDF::URI.new(NCBI_BASE + "medgen/" + cid)]
              end
              graph << [subject, ::RDF::Vocab::DC.identifier, statement.object]
              graph.delete(statement)
            when Vocab[:db]
              cdb = statement.object
              if cdb == "MedGen" && cid != nil
                graph << [subject, ::RDF::Vocab::DC.references, ::RDF::URI.new(NCBI_BASE + "medgen/" + cid)]
              end
              graph << [subject, ::RDF::Vocab::DC.source, statement.object]
              graph.delete(statement)
            end
          end

          graph
        end
        Model::TypeRCVInterpretedCondition.prepend self
      end

      # Model specific refinement for SetElementSetType
      module SetElementSetTypeRefine
        def to_rdf
          graph = super

          graph.query([subject,Vocab[:element_value],nil]).each do |statement|
            graph.query([statement.object, nil, nil]).each do |data|
              case data.predicate
              when Vocab[:element_value]
                graph << [subject, ::RDF::Vocab::RDFS.label, data.object]
              when Vocab[:type]
                graph << [subject, Vocab[:label_type], data.object]
              end
              graph.delete(data)
            end
            graph.delete(statement)
          end
          graph.delete([subject, ::RDF.type, Vocab[:SetElementSetType]])

          graph
        end
        Model::SetElementSetType.prepend self
      end

    end
  end
end
