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

        def to_rdf
          graph = super

          id = xmlattr_variation_id&.to_s || xmlattr_accession&.match(/VCV(\d+)/)&.[](1)

          if id.present?
            graph << [subject, ::RDF::Vocab::RDFS.seeAlso, ::RDF::URI.new(VCV_ID_BASE + id)]
          end

          graph
        end

        Model::VariationArchiveType.prepend self
        Model::TypeRecordHistory.prepend self
        Model::IncludedRecord::InterpretedVariationList::InterpretedVariation.prepend self
      end

      # Attribute specific refinement for Allele ID
      module TypeAlleleRefine
        def to_rdf
          graph = super

          if xmlattr_allele_id.present?
            graph << [subject, ::RDF::Vocab::DC.identifier, xmlattr_allele_id]
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
                ::RDF::URI.new(VCV_ID_BASE + id)
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
            graph << [subject, ::RDF::Vocab::RDFS.seeAlso, ::RDF::URI.new(NCBI_GENE_ID_BASE + xmlattr_gene_id)]
          end

          graph
        end

        Model::TypeAllele::GeneList::Gene.prepend self
      end

      # Model specific refinement for TypeLocation
      module TypeLocationRefine

        def to_rdf
          graph = super

          graph.query([nil, Vocab[:sequence_location], nil]).each do |statement|
            graph << [statement.subject, FALDO[:location], statement.object]
            graph.delete(statement)
          end

          graph
        end

        Model::TypeLocation.prepend self
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
            graph << [subject, FALDO.position, start_val]
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
            append_position(graph, FALDO.begin, start_val)
          end
          if [xmlattr_inner_stop, xmlattr_outer_stop].any?
            append_fuzzy_position(graph, FALDO.end, xmlattr_inner_stop, xmlattr_outer_stop)
          else
            append_position(graph, FALDO.end, stop_val)
          end
        end

        def append_fuzzy_position(graph, property, inner, outer)
          graph << [subject, property, bn = ::RDF::Node.new]
          graph << [bn, ::RDF.type, FALDO.ExactPosition]
          if xmlattr_strand == '+'
            graph << [bn, ::RDF.type, FALDO.ForwardStrandPosition]
          elsif xmlattr_strand == '-'
            graph << [bn, ::RDF.type, FALDO.ReverseStrandPosition]
          end
          if inner.present?
            append_position(graph, FALDO.begin, inner)
          end
          if outer.present?
            append_position(graph, FALDO.end, outer)
          end
        end

        def append_positions(graph)
          start_val = xmlattr_start || xmlattr_display_start
          stop_val  = xmlattr_stop || xmlattr_display_stop
          graph << [subject, ::RDF.type, FALDO.Region]
          append_position(graph, FALDO.begin, start_val)
          append_position(graph, FALDO.end, stop_val)
        end

        def append_position(graph, property, position)
          graph << [subject, property, bn = ::RDF::Node.new]
          graph << [bn, ::RDF.type, FALDO.ExactPosition]
          if xmlattr_strand == '+'
            graph << [bn, ::RDF.type, FALDO.ForwardStrandPosition]
          elsif xmlattr_strand == '-'
            graph << [bn, ::RDF.type, FALDO.ReverseStrandPosition]
          end
          graph << [bn, FALDO.position, position]

          if xmlattr_accession.present?
            graph << [bn, FALDO.reference, ::RDF::URI.new(REFSEQ_ID_BASE % xmlattr_accession)]

            if (hco = refseq2hco(xmlattr_accession, xmlattr_assembly))
              graph << [bn, FALDO.reference, hco]
            end
          end
        end

        Model::TypeLocation::SequenceLocation.prepend self
      end

    end
  end
end
