require 'spec_helper'

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

end
