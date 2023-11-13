require 'rails_helper'

RSpec.describe 'Api::V1::TouristSite', type: :request do
  describe 'GET #search' do
    it 'returns a successful response', :vcr do
      get '/api/v1/tourist_sites', params: { country: 'france' }
      expect(response).to be_successful
    end

    it 'returns a list of tourist sites', :vcr do
      get '/api/v1/tourist_sites', params: { country: 'france' }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data].first[:attributes]).to have_key(:name)
      expect(json[:data].first[:attributes]).to have_key(:address)
      expect(json[:data].first[:attributes]).to have_key(:place_id)
      expect(json[:data].first[:attributes].count).to eq(3)
    end

    it 'returns an empty array if no coordinates are found', :vcr do
      get '/api/v1/tourist_sites', params: { country: 'asdfasdf' }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data]).to eq([])
    end

    it 'returns an empty array if no sites are found', :vcr do
      get '/api/v1/tourist_sites', params: { country: 'antarctica' }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data]).to eq([])
    end
  end
end