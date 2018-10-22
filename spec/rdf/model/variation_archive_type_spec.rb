require 'spec_helper'
require 'xmlsimple'

RSpec.describe ClinVar::RDF::Model::VariationArchiveType do

  it 'should respond to .build' do
    expect(ClinVar::RDF::Model::VariationArchiveType.respond_to?(:build)).to be_truthy
  end

  describe '.build' do

    it 'should return an instance of self' do
      expect(ClinVar::RDF::Model::VariationArchiveType.build({})).to be_kind_of(ClinVar::RDF::Model::VariationArchiveType)
    end

  end

  it 'should respond to #to_rdf' do
    expect(ClinVar::RDF::Model::VariationArchiveType.new.respond_to?(:to_rdf)).to be_truthy
  end

  describe '#to_rdf' do

    it 'should return an instance of RDF::Graph' do
      expect(ClinVar::RDF::Model::VariationArchiveType.new.to_rdf).to be_kind_of(RDF::Graph)
    end

  end

  describe 'RDF::Graph' do

    context 'variation_archive_20180705.xsd' do

      before :all do
        record = XmlSimple.xml_in(File.read('spec/sample/VCV000018390.xml'))

        @subject = RDF::URI.new('http://example.com/VCV000018390')

        @graph = ClinVar::RDF::Model::VariationArchiveType
          .build(record)
          .subject(RDF::URI.new('http://example.com/VCV000018390'))
          .to_rdf
      end

      let (:subject) { @subject }
      let (:g) { @graph }

      it 'should be VariationArchiveType' do
        expect(g.query(subject: subject, predicate: RDF.type).first_object).to eq(ClinVar::RDF::Vocab[:VariationArchiveType])
      end

      # attribute / literal
      it 'should have accession' do
        expect(g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:accession]).first_object).to eq(RDF::Literal.new('VCV000018390'))
      end

      # attribute / date
      it 'should have date created' do
        expect(g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:date_created]).first_object).to eq(RDF::Literal::Date.new('2010-12-01'))
      end

      # attribute / integer
      it 'should have number of submissions' do
        expect(g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:number_of_submissions]).first_object).to eq(RDF::Literal::Integer.new(5))
      end

      # element / literal
      it 'should have record status' do
        expect(g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:record_status]).first_object).to eq(RDF::Literal.new('current'))
      end

      # element / complex type
      it 'should have interpreted record' do
        expect(g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:interpreted_record]).first_object).to be_kind_of(RDF::Node)
      end

    end

  end

end
