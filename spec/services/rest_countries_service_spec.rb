require 'rails_helper'

RSpec.describe RestCountriesService do
  describe '.random_country' do
    it 'returns a random country name', :vcr do
      country_name = RestCountriesService.random_country
      expect(country_name).to be_a(String)
      expect(country_name).not_to be_empty
    end
  end

  describe '.get_capital' do
    it 'returns the coordinates of a capital of a country', :vcr do
      capital = RestCountriesService.get_capital('france')

      expect(capital).to be_an Array
      expect(capital).to eq([48.87, 2.33])
    end
  end
end
