require 'rails_helper'

RSpec.describe RestCountriesService do
  describe '.random_country' do
    it 'returns a random country name', :vcr do
      country_name = RestCountriesService.random_country
      expect(country_name).to be_a(String)
      expect(country_name).not_to be_empty
    end
  end
end
