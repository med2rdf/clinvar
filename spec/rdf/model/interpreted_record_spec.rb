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

    end

  end

end
