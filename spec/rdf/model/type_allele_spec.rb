require 'spec_helper'
require 'xmlsimple'

RSpec.describe ClinVar::RDF::Model::TypeAllele do

  it 'should respond to .build' do
    expect(ClinVar::RDF::Model::TypeAllele.respond_to?(:build)).to be_truthy
  end

  describe '.build' do

    it 'should return an instance of self' do
      expect(ClinVar::RDF::Model::TypeAllele.build({})).to be_kind_of(ClinVar::RDF::Model::TypeAllele)
    end

  end

  it 'should respond to #to_rdf' do
    expect(ClinVar::RDF::Model::TypeAllele.new.respond_to?(:to_rdf)).to be_truthy
  end

  describe '#to_rdf' do

    it 'should return an instance of RDF::Graph' do
      expect(ClinVar::RDF::Model::TypeAllele.new.to_rdf).to be_kind_of(RDF::Graph)
    end

  end

  describe 'RDF::Graph' do

    context 'variation_archive_20180705.xsd' do

      before :all do
        record = XmlSimple.xml_in(File.read('spec/sample/VCV000018390.xml'))

        @subject = RDF::URI.new('http://example.com/VCV000018390/InterpretedRecord/SimpleAllele')

        @graph = ClinVar::RDF::Model::TypeAllele
                   .build(record['InterpretedRecord'][0]['SimpleAllele'][0])
                   .subject(@subject)
                   .to_rdf
      end

      let (:subject) { @subject }
      let (:g) { @graph }

      it 'should be TypeAllele' do
        expect(g.query(subject: subject, predicate: RDF.type).first_object).to eq(ClinVar::RDF::Vocab[:TypeAllele])
      end

    end

  end

end
