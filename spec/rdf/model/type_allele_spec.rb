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

      # attribute / integer
      it 'should have allele ID' do
        expect(g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:allele_id]).first_object).to eq(RDF::Literal::Integer.new(33429))
      end

      # attribute / integer
      it 'should have variation ID' do
        expect(g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:variation_id]).first_object).to eq(RDF::Literal::Integer.new(18390))
      end

      # element / string
      it 'should have variant type' do
        expect(g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:variant_type]).first_object).to eq(RDF::Literal.new('single nucleotide variant'))
      end

      # element / string
      it 'should have name' do
        result = g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:name]).map(&:object)

        expect(result).to include(RDF::Literal.new('NM_000690.3(ALDH2):c.1510G>A (p.Glu504Lys)'))
      end

      # element / complex type
      it 'should have other names' do
        result = g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:name]).map(&:object)

        other_names = result.select { |x| x.is_a?(RDF::Node) }.map { |s| g.query(subject: s, predicate: ClinVar::RDF::Vocab[:name]).map(&:object) }.flatten
        expect(other_names.size).to be(3)
        expect(other_names).to contain_exactly(RDF::Literal.new('ALDH2*2'), RDF::Literal.new('ALDH2, GLU504LYS (rs671)'), RDF::Literal.new('GLU487LYS'))

        klass = result.select { |x| x.is_a?(RDF::Node) }.map { |s| g.query(subject: s, predicate: RDF.type).map(&:object) }.flatten.uniq
        expect(klass.size).to be(1)
        expect(klass.first).to eq(ClinVar::RDF::Vocab[:Name])
      end

    end

  end

end
