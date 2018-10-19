require 'spec_helper'

RSpec.describe ClinVar::RDF::Model do

  it 'has a type of root element' do
    expect(ClinVar::RDF::Model.const_defined?(:ReleaseType)).to be_truthy
  end
  end

end
