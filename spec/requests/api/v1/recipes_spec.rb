require 'rails_helper'

RSpec.describe 'Api::V1::Recipes', type: :request do
  describe 'GET #search' do
    it 'returns a successful response', :vcr do
      get '/api/v1/recipes/search', params: { query: 'thailand' }

      expect(response).to be_successful
    end

    it 'returns a list of recipes', :vcr do
      get '/api/v1/recipes/search', params: { query: 'thailand' }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data].first[:id]).to be nil
      expect(json[:data].first[:type]).to eq("recipe")
      expect(json[:data].first[:attributes][:title]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(json[:data].first[:attributes][:url]).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
      expect(json[:data].first[:attributes][:country]).to eq("thailand")
      expect(json[:data].first[:attributes][:image]).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIB%2FZ9c7ESRuY5SvFIqHj6rvHT7%2F9jrvA%2FNbbuPJSpR8xAiB0o7cb1Vjp1%2BRSzkKw%2FYSPuXyOGXlu0RdflSEl9RPsESq4BQg2EAAaDDE4NzAxNzE1MDk4NiIMahCyHXaT%2Buwd%2FJxeKpUF%2B%2BR62aZO0uncsyuRRoZNnd11N1jILF0oM3YqJ3468xSs%2BEexdUfLHIxxGxvEhEl2SMQF%2BLJyk%2Fap2o6DinKL2UdsYBBsHFB%2BcTn5qpL1ZvrUUWp3Ex4Rpd4ysYWdXZNVjRK07pWuSm1psQ312pNczYfnq9N8jzq3B3uNcHwVVnekoyrXx7LcUkn2V4nmebfwGeIZuNpKXo8GnTdeGhJZIoC3SQuelk7ib42Yz%2FICFLX%2BJ9veZvfPSum6cYFzboxdS4BfYLGnZHepBrA1L5Q7gn5nRCZHbHilGuyBn%2B8zFt0CHTn2ZSail%2BtZMXCnwCR8soeVyySPNqcs%2BqAcKZEz8lUzLU%2BcCqA6JfTc2p7gwatAfu7kIY4SLcjjnGssHO%2BGQG%2FNGt7%2Bnh9pljqUwoxoJIwDjKhzZwEvXdctUfir5n%2Fm9QpwchMZ%2FvyzpP3MaQY9nQ4kLwGn8OWANAMScYC1%2FFFaAPA0gCjcUi1649Lu2TN6u8861eHBRNCXqyKYkqvaZpZQlBLuPGV477Nh3b%2FxlOY0UTgcp%2FliIzZYBzVG0DsfBQGNGescBq30EC2LdK9xmHSCeEBRiFlw0mkDGpvCKbm4nJgRFWM1mX1fdcMVkrJ%2FzMVqSDzx9KVL5kDBmrxP3dp8OwklPekbTnY70NN16abCvgNfnAIGH54zu%2BP7KjIl9aA0YdXNpyqf0bIfFMkjA27vhx7gRbahPtgry3KYzco7II209Vhh%2BvQGzRWMe4sR4ezdJw6K%2Bxq3v6W%2F6zBi%2FRypjDDVUTxx05NhHi%2Bi18%2FauCBkORsw0b%2BvqdLqRZvy51uPQ1Tcwyy%2Bp4zH9fiqfT0CyeGbBJUucqUTV%2FI1QbUHCdw1t8awB%2FwrrbIt3jr6EVPChTDu9sSqBjqyATvfqyeXpC7lCit6UYjUOgFp7U7m99tgPEbScWHD9bGBehTC4aoH2VEp6kfKzpC%2BchIX90LKyDjezgQtcq2uEOnSJwpoJSu%2Fp%2B8I3KPm9qLFHqHXF7hkZd2TSJ2hmKu2avkP%2BYZ%2B0tXV%2Frm0O4Jqk4iRBgVPZaZD2Nb0F2nswGpFzb0uuFyuS8Xnq6PXu1SEOJtvd4Ty2BR59IXNpyR4a56v8dVF13SJKH0J33TV9rEpCyU%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231112T213812Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIBERP5UF%2F20231112%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=2b6bb886c40afcb4258892a1923f583a07bea69275dafc47c655f11e6eb1d421")
    end
  
    it 'returns an empty array if no query is provided', :vcr do
      get '/api/v1/recipes/search', params: { query: '' }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data]).to eq([])
    end

  end


end