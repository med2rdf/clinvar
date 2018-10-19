require 'spec_helper'

RSpec.describe ClinVar::RDF::Model do

  it 'has a type of root element' do
    expect(ClinVar::RDF::Model.const_defined?(:ReleaseType)).to be_truthy
  end

  describe 'ClinVar::RDF::Model::ReleaseType' do

    it 'should respond to #to_rdf' do
      expect(ClinVar::RDF::Model::ReleaseType.new.respond_to?(:to_rdf)).to be_truthy
    end

  end

end