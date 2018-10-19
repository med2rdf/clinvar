require 'spec_helper'

RSpec.describe ClinVar::XSD do

  let (:xsd_sample) { File.expand_path('../../sample/variation_archive_20180705.xsd', __FILE__) }

  it 'should respond to .open' do
    expect(ClinVar::XSD.respond_to?(:open)).to be_truthy
  end

  describe '.open' do

    it 'should return an instance of self' do
      expect(ClinVar::XSD.open(xsd_sample)).kind_of? ClinVar::XSD
    end

    context 'if block given' do

      it 'should return last evaluation of given block' do
        actual = ClinVar::XSD.open(xsd_sample) do
          'last evaluation'
        end

        expect(actual).to eq('last evaluation')
      end

    end

  end

end
