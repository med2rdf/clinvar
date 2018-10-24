require 'spec_helper'
require 'xmlsimple'

RSpec.describe ClinVar::RDF::Model::InterpretedRecord::RCVList do

  it 'should respond to .build' do
    expect(ClinVar::RDF::Model::InterpretedRecord::RCVList.respond_to?(:build)).to be_truthy
  end

  describe '.build' do

    it 'should return an instance of self' do
      expect(ClinVar::RDF::Model::InterpretedRecord::RCVList.build({})).to be_kind_of(ClinVar::RDF::Model::InterpretedRecord::RCVList)
    end

  end

  it 'should respond to #to_rdf' do
    expect(ClinVar::RDF::Model::InterpretedRecord::RCVList.new.respond_to?(:to_rdf)).to be_truthy
  end

  describe '#to_rdf' do

    it 'should return an instance of RDF::Graph' do
      expect(ClinVar::RDF::Model::InterpretedRecord::RCVList.new.to_rdf).to be_kind_of(RDF::Graph)
    end

  end

  describe 'RDF::Graph' do

    context 'variation_archive_20180705.xsd' do

      before :all do
        record = XmlSimple.xml_in(File.read('spec/sample/VCV000018390.xml'))

        @subject = RDF::URI.new('http://example.com/VCV000018390/InterpretedRecord/RCVList')

        @graph = ClinVar::RDF::Model::InterpretedRecord::RCVList
                   .build(record['InterpretedRecord'][0]['RCVList'][0])
                   .subject(@subject)
                   .to_rdf

        @subject_rcv = RDF::URI.new('http://example.com/VCV000018390/InterpretedRecord/RCVList/RCVAccession')

        @graph_rcv = ClinVar::RDF::Model::TypeRCV
                       .build(record['InterpretedRecord'][0]['RCVList'][0]['RCVAccession'].find { |x| x['Accession'] == 'RCV000020058' })
                       .subject(@subject_rcv)
                       .to_rdf
      end

      let (:subject) { @subject }
      let (:g) { @graph }

      it 'should be RCVList' do
        expect(g.query(subject: subject, predicate: RDF.type).first_object).to eq(ClinVar::RDF::Vocab[:RCVList])
      end

      # element / complex type
      it 'should have RCV Accessions' do
        result = g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:rcv_accession]).map(&:object)

        expect(result.size).to be(5)

        klass = result.select { |x| x.is_a?(RDF::Node) }.map { |s| g.query(subject: s, predicate: RDF.type).map(&:object) }.flatten.uniq
        expect(klass.size).to be(1)
        expect(klass.first).to eq(ClinVar::RDF::Vocab[:TypeRCV])
      end

      context 'RCV000020058' do

        let (:subject) { @subject_rcv }
        let (:g) { @graph_rcv }

        it 'should be TypeRCV' do
          expect(g.query(subject: subject, predicate: RDF.type).first_object).to eq(ClinVar::RDF::Vocab[:TypeRCV])
        end

        # attribute / string
        it 'should have title' do
          expect(g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:title]).first_object).to eq(RDF::Literal.new('NM_000690.3(ALDH2):c.1510G>A (p.Glu504Lys) AND Acute alcohol sensitivity'))
        end

        # attribute / date
        it 'should have date last evaluated' do
          expect(g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:date_last_evaluated]).first_object).to eq(RDF::Literal::Date.new('2013-04-04'))
        end

        # element / array type
        it 'should have interpreted conditions' do
          result = g.query(subject: subject, predicate: ClinVar::RDF::Vocab[:interpreted_condition])
          expect(result.size).to be(1)

          expect(g.query(subject: result.first.object, predicate: ClinVar::RDF::Vocab[:db]).first_object).to eq(RDF::Literal.new('MedGen'))
          expect(g.query(subject: result.first.object, predicate: ClinVar::RDF::Vocab[:id]).first_object).to eq(RDF::Literal.new('C2674838'))
          expect(g.query(subject: result.first.object, predicate: ClinVar::RDF::Vocab[:type_rcv_interpreted_condition]).first_object).to eq(RDF::Literal.new('Acute alcohol sensitivity'))
        end

      end

    end

  end

end
