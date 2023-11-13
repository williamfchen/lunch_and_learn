require 'rails_helper'

RSpec.describe TouristSite do
  let(:location_data) do
    {
      properties: {
        name: 'Statue of Liberty',
        formatted: 'New York, NY 10004, United States',
        place_id: 'asdfasdfasdf'
      }
    }
  end

  subject(:tourist_site) { described_class.new(location_data) }

  describe '#name' do
    it 'returns the name of the tourist site' do
      expect(tourist_site.name).to eq('Statue of Liberty')
    end
  end

  describe '#address' do
    it 'returns the address of the tourist site' do
      expect(tourist_site.address).to eq('New York, NY 10004, United States')
    end
  end

  describe '#place_id' do
    it 'returns the place ID of the tourist site' do
      expect(tourist_site.place_id).to eq('asdfasdfasdf')
    end
  end
end
