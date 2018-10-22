require 'spec_helper'
require 'xmlsimple'

RSpec.describe ClinVar::RDF::Model::InterpretedRecord do

  it 'should respond to .build' do
    expect(ClinVar::RDF::Model::InterpretedRecord.respond_to?(:build)).to be_truthy
  end

  describe '.build' do

    it 'should return an instance of self' do
      expect(ClinVar::RDF::Model::InterpretedRecord.build({})).to be_kind_of(ClinVar::RDF::Model::InterpretedRecord)
    end

  end

  it 'should respond to #to_rdf' do
    expect(ClinVar::RDF::Model::InterpretedRecord.new.respond_to?(:to_rdf)).to be_truthy
  end

  describe '#to_rdf' do

    it 'should return an instance of RDF::Graph' do
      expect(ClinVar::RDF::Model::InterpretedRecord.new.to_rdf).to be_kind_of(RDF::Graph)
    end

  end

  describe 'RDF::Graph' do

    context 'variation_archive_20180705.xsd' do

      before :all do
        record = XmlSimple.xml_in(File.read('spec/sample/VCV000018390.xml'))

        @subject = RDF::URI.new('http://example.com/VCV000018390/InterpretedRecord')

        @graph = ClinVar::RDF::Model::InterpretedRecord
                   .build(record['InterpretedRecord'][0])
                   .subject(@subject)
                   .to_rdf
      end

      let (:subject) { @subject }
      let (:g) { @graph }

      it 'should be InterpretedRecord' do
        expect(g.query(subject: subject, predicate: RDF.type).first_object).to eq(ClinVar::RDF::Vocab[:InterpretedRecord])
      end

      # element / complex type
      it 'should have simple allele' do
        result = g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:simple_allele]).first_object

        expect(result).to be_kind_of(RDF::Node)
        expect(g.query(subject: result, predicate: RDF.type).first_object).to eq(ClinVar::RDF::Vocab[:TypeAllele])
      end

      # element / literal
      it 'should have review status' do
        expect(g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:review_status]).first_object).to eq(RDF::Literal.new('no assertion criteria provided'))
      end

      # element / complex type
      it 'should have rcv list' do
        result = g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:rcv_list]).first_object

        expect(result).to be_kind_of(RDF::Node)
        expect(g.query(subject: result, predicate: RDF.type).first_object).to eq(ClinVar::RDF::Vocab[:RCVList])
      end

      # element / array type
      it 'should have interpretations' do
        result = g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:interpretation]).first_object

        expect(result).to be_kind_of(RDF::Node)
        expect(g.query(subject: result, predicate: RDF.type).first_object).to eq(ClinVar::RDF::Vocab[:TypeAggregatedInterpretation])
      end

      # element / array type
      it 'should have clinical assertion list' do
        result = g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:clinical_assertion]).first_object

        expect(result).to be_kind_of(RDF::Node)
        expect(g.query(subject: result, predicate: RDF.type).first_object).to eq(ClinVar::RDF::Vocab[:MeasureTraitType])
      end

      # element / array type
      it 'should have trait mapping list' do
        # result = g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:trait_mapping_list]).first_object
        result = g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:trait_mapping]).first_object

        expect(result).to be_kind_of(RDF::Node)
        expect(g.query(subject: result, predicate: RDF.type).first_object).to eq(ClinVar::RDF::Vocab[:TraitMapping])
      end

    end

  end

end
