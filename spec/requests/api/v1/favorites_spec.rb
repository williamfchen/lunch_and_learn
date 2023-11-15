require 'rails_helper'

RSpec.describe 'Favorites API', type: :request do
  describe 'POST /api/v1/favorites' do
    before do
      @user = User.create!(name: 'Will', email: 'will@will.com', password: 'password', api_key: 'asdfasdfasdfasdf')
    end

    let(:valid_attributes) do 
      {
        api_key: @user.api_key,
        country: "thailand",
        recipe_link: "https://www.tastingtable.com/some-recipe",
        recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
      }
    end

    context 'when the request is valid' do
      before { post '/api/v1/favorites', params: valid_attributes.to_json, headers: { 'CONTENT_TYPE' => 'application/json' } }

      it 'creates a favorite' do
        favorite = Favorite.last
        expect(favorite.user_id).to eq(@user.id)
        expect(favorite.country).to eq('thailand')
        expect(favorite.recipe_link).to eq('https://www.tastingtable.com/some-recipe')
        expect(favorite.recipe_title).to eq('Crab Fried Rice (Khaao Pad Bpu)')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the api_key is invalid' do
      before { post '/api/v1/favorites', params: { api_key: 'wrongwrongwrong' }.to_json, headers: { 'CONTENT_TYPE' => 'application/json' } }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'GET /api/v1/favorites' do
    before do
      @user = User.create!(name: 'Will', email: 'will@will.com', password: 'password', api_key: 'asdfasdfasdfasdf')
      @favorite1 = Favorite.create!(user: @user, country: 'Thailand', recipe_link: 'https://www.example.com/thai_recipe', recipe_title: 'Thai Recipe')
      @favorite2 = Favorite.create!(user: @user, country: 'Japan', recipe_link: 'https://www.example.com/japanese_recipe', recipe_title: 'Japanese Recipe')
    end

    let(:json) { JSON.parse(response.body, symbolize_names: true) }

    context 'when the api_key is valid' do
      before { get '/api/v1/favorites', params: { api_key: @user.api_key } }

      it 'returns all favorites' do
        expect(response).to have_http_status(200)
        expect(json[:data].size).to eq(2)
      end

      it 'returns the correct data' do
        expect(json[:data][0][:attributes][:recipe_title]).to eq(@favorite1.recipe_title)
        expect(json[:data][1][:attributes][:recipe_title]).to eq(@favorite2.recipe_title)
      end
    end

    context 'when the api_key is invalid' do
      before { get '/api/v1/favorites', params: { api_key: 'wrongwrongwrong' } }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    context 'when the user has no favorites' do
      before do
        @user.favorites.destroy_all
        get '/api/v1/favorites', params: { api_key: @user.api_key }
      end

      it 'returns an empty array' do
        expect(response).to have_http_status(200)
        expect(json[:data]).to be_empty
      end
    end
  end

  describe 'DELETE /api/v1/favorites' do
    before do
      @user = User.create!(name: 'Will', email: 'will@will.com', password: 'password', api_key: 'asdfasdfasdfasdf')
      @favorite = Favorite.create!(user: @user, country: 'Thailand', recipe_link: 'https://www.example.com/thai_recipe', recipe_title: 'Thai Recipe')
    end

    context 'when the api_key is valid' do
      it 'deletes the favorite' do
        delete '/api/v1/favorites', 
               params: { api_key: @user.api_key, favorite_id: @favorite.id }.to_json,
               headers: { 'CONTENT_TYPE' => 'application/json' }

        expect(response).to have_http_status(200)
        expect(Favorite.find_by(id: @favorite.id)).to be_nil
      end
    end

    context 'when the api_key is invalid' do 
      it 'returns status code 401' do
        delete '/api/v1/favorites', 
               params: { api_key: 'wrongwrongwrong', favorite_id: @favorite.id }.to_json,
               headers: { 'CONTENT_TYPE' => 'application/json' }

        expect(response).to have_http_status(401)
      end
    end

    context 'when the favorite does not exist' do
      it 'returns status code 404' do
        delete '/api/v1/favorites', 
               params: { api_key: @user.api_key, favorite_id: 999 }.to_json,
               headers: { 'CONTENT_TYPE' => 'application/json' }

        expect(response).to have_http_status(404)
      end
    end
  end
end
