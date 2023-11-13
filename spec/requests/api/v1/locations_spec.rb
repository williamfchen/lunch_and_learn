require 'rails_helper'

RSpec.describe 'Api::V1::Locations', type: :request do
  describe 'GET #search' do
    it 'returns a successful response', :vcr do
      get '/api/v1/locations', params: { category: 'catering.restaurant' }
      expect(response).to be_successful
    end
  end
end