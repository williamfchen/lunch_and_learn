require 'rails_helper'

RSpec.describe 'Api::V1::Recipes', type: :request do
  describe 'GET #search' do
    it 'returns a successful response', :vcr do
      get '/api/v1/recipes', params: { country: 'thailand' }

      expect(response).to be_successful
    end

    it 'returns a list of recipes', :vcr do
      get '/api/v1/recipes', params: { country: 'thailand' }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:data)
      expect(json[:data]).to be_a(Array)
      expect(json[:data].first[:id]).to be nil
      expect(json[:data].first[:type]).to eq("recipe")
      expect(json[:data].first[:attributes][:title]).to be_a(String)
      expect(json[:data].first[:attributes][:url]).to be_a(String)
      expect(json[:data].first[:attributes][:country]).to be_a(String)
      expect(json[:data].first[:attributes][:image]).to be_a(String)
      expect(json[:data].first[:attributes].count).to eq(4)
    end
  end

  context 'when country param has no results' do
    it 'returns an empty array', :vcr do
      get '/api/v1/recipes', params: { country: 'asdfasdfasdfasdf' }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data]).to eq([])

    end
  end

  context 'when country param is missing' do
    it 'returns a random country' do
      VCR.use_cassette("random_country", record: :new_episodes) do
        get '/api/v1/recipes'
  
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to have_key(:data)
        expect(json[:data]).to be_a(Array)
        expect(json[:data].first[:id]).to be nil
        expect(json[:data].first[:type]).to eq("recipe")
        expect(json[:data].first[:attributes][:title]).to be_a(String)
        expect(json[:data].first[:attributes][:url]).to be_a(String)
        expect(json[:data].first[:attributes][:country]).to be_a(String)
        expect(json[:data].first[:attributes][:image]).to be_a(String)
        expect(json[:data].first[:attributes].count).to eq(4)
      end
    end
  end
end