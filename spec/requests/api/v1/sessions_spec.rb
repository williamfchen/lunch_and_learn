require 'rails_helper'

RSpec.describe 'Sessions API', type: :request do
  describe 'POST /sessions' do
    let(:user) { User.create!(name: 'Will', email: 'will@will.com', password: 'password', password_confirmation: 'password') }
    let(:valid_credentials) { { email: user.email, password: 'password' } }
    let(:invalid_credentials) { { email: user.email, password: 'wrong' } }

    context 'when the request is valid' do
      before { post '/api/v1/sessions', params: valid_credentials }
      let(:json) { JSON.parse(response.body, symbolize_names: true) }

      it 'returns a json with attributes' do
        expect(json[:data][:attributes][:name]).to eq(user.name)
        expect(json[:data][:attributes][:email]).to eq(user.email)
        expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
      end

      it 'returns a success status code' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/sessions', params: invalid_credentials }
      let(:json) { JSON.parse(response.body, symbolize_names: true) }

      it 'returns an error message' do
        expect(json[:error]).to match(/Invalid credentials/)
      end

      it 'returns an unauthorized status code' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
