require 'rails_helper'

RSpec.describe GeoapifyService do
  describe '.search' do
    it 'returns an array of places', :vcr do
      places = GeoapifyService.search([48.87, 2.33])

      expect(places).to be_an(Array)
      expect(places.first).to have_key(:properties)
    end
  end
end
