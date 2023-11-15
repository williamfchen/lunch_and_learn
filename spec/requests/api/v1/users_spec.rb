require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  describe 'POST /api/v1/users' do
    it 'creates a new user' do
      request_body = {
        user: {
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
          password_confirmation: "treats4lyf"
        }
      }.to_json

      post '/api/v1/users', params: request_body, headers: { 'CONTENT_TYPE' => 'application/json' }

      expect(response).to have_http_status(201)
      expect(response.body).to include("Odell")
      expect(response.body).to include("goodboy@ruffruff.com")
      expect(response.body).not_to include("treats4lyf")
    end

    it 'returns an error if the user is not created' do
      request_body = {
        user: {
          name: "Odell"
        }
      }.to_json

      post '/api/v1/users', params: request_body, headers: { 'CONTENT_TYPE' => 'application/json' }

      expect(response).to have_http_status(422)
    end
  end
end
