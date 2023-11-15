require 'rails_helper'

RSpec.describe 'Api::V1::LearningResources', type: :request do
  describe 'GET #show' do
    it 'returns a successful response', :vcr do
      get '/api/v1/learning_resources', params: { country: 'somalia' }
      
      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(json).to have_key(:data)
      expect(json[:data]).to have_key(:id)
      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to have_key(:country)
      expect(json[:data][:attributes]).to have_key(:video)
      expect(json[:data][:attributes]).to have_key(:images)
    end

    it 'returns a successful response with empty objects when no data is found', :vcr do
      get '/api/v1/learning_resources', params: { country: 'asdfasdfasdfasdfasdf' }
      
      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:attributes][:video]).to be_empty
      expect(json[:data][:attributes][:images]).to be_empty
    end
  end
end
