require 'spec_helper'

RSpec.describe ClinVar::RDF do
  it 'has a version number' do
    expect(ClinVar::RDF::VERSION).not_to be nil
  end
end
