require 'spec_helper'

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

end
