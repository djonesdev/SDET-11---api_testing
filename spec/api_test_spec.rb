require 'spec_helper'
require 'httparty'


describe 'httparty tests' do

  before(:all) do
    @json = JSON.parse(HTTParty.get('https://api.postcodes.io/postcodes/so153ar').body)
  end

    it 'postcode must equal SO153AR' do
      expect(@json['result']['postcode']).to eq('SO15 3AR')
    end

    it 'Eastings should have an integer or null value' do
        if @json['result']['eastings'].class == Integer
          expect(@json['result']['eastings']).to be_kind_of(Integer)
        elsif @json['result']['eastings'].class == NilClass
          expect(@json['result']['eastinsgs']).to be_falsey
        end
    end

    it 'Eastings should have an integer or nul value' do
      expect(@json['result']['eastings'].class).to eq(Integer || NilClass)
    end

    it 'Postcode must contain 4 characters and then a space.' do
      expect(@json['result']['postcode']).to include(' ')
    end

    it 'positional quality to be between 1 and 9' do
      expect(@json['result']['quality']).to be_between(1, 8)
    end

    it 'eastings should have an integer value' do
      expect(@json['result']['eastings']).to be_kind_of(Integer)
    end

    it 'northings should have an integer value' do
      expect(@json['result']['northings']).to be_kind_of(Integer)
    end

    it 'Country should be a type of string' do
       expect(@json['result']['country']).to be_kind_of(String)
    end

    it 'Country should have the value England' do
       expect(@json['result']['country']).to eq('England')
    end


    it 'NHS health area should be south central' do
      expect(@json['result']['nhs_ha']).to eq('South Central')
    end

    it "The value of admin_county to be null" do
      expect(@json['result']['admin_county']).to eq(nil)
    end

    it 'admin_county code should equal E99999999' do
      expect(@json['result']['codes']['admin_county']).to eq('E99999999')
    end

    it 'Logitude should be a type of float' do
      expect(@json['result']['longitude']).to be_kind_of(Float)
    end

    it 'Latitude should be a type of float' do
      expect(@json['result']['latitude']).to be_kind_of(Float)
    end

    it 'European electoral region and region should result in South East' do
      expect(@json['result']['european_electoral_region']).to be == ('South East')
      expect(@json['result']['region']).to be == ('South East')
    end

    it 'should expect country to be England, Scotland, Wales, NI' do
      expect(@json['result']['country']).to eq(('England') || ('Scotland') || ('Wales') || ('Northen Ireland'))
    end

    it 'Codes has should contain 7 keys' do
      expect(@json['result']['codes'].size).to eq(7)
    end

end
