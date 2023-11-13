require 'rails_helper'

RSpec.describe 'Api::V1::LearningResources', type: :request do
  describe 'GET #show' do
    xit 'returns a successful response', :vcr do
      get '/api/v1/learning_resources', params: { country: 'somalia' }
      
      expect(response).to be_successful
    end
  end
end