require 'spec_helper'

RSpec.describe ClinVar::XML::XSD do

  let (:xsd_sample) { URI.join('file:///', File.expand_path('../../sample/variation_archive_20180705.xsd', __FILE__)) }

  it 'should respond to .open' do
    expect(ClinVar::XML::XSD.respond_to?(:open)).to be_truthy
  end

  describe '.open' do

    it 'should return an instance of self' do
      expect(ClinVar::XML::XSD.open(xsd_sample)).to be_kind_of(ClinVar::XML::XSD)
    end

    context 'if block given' do

      it 'should return last evaluation of given block' do
        actual = ClinVar::XML::XSD.open(xsd_sample) do
          'last evaluation'
        end

        expect(actual).to eq('last evaluation')
      end

    end

  end

  it 'should respond to #to_ruby' do
    expect(ClinVar::XML::XSD.new(nil).respond_to?(:to_ruby)).to be_truthy
  end

  describe '#to_ruby' do

    it 'should return evaluable string' do
      to_ruby = ClinVar::XML::XSD.open(xsd_sample) do |xsd|
        xsd.to_ruby
      end

      expect(to_ruby).to be_kind_of(String)
    end

  end

end
