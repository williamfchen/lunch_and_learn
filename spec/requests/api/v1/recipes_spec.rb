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

      expect(json[:data].first[:id]).to be nil
      expect(json[:data].first[:type]).to eq("recipe")
      expect(json[:data].first[:attributes][:title]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(json[:data].first[:attributes][:url]).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
      expect(json[:data].first[:attributes][:country]).to eq("thailand")
      expect(json[:data].first[:attributes][:image]).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQC94wQ6mdxIno%2BlN%2BnKjf3tImPdZUuGOB3eNTYV5kXfkAIhAJyembeLbySsSHs0K3KG21NNC4v8OdXovCdeS7sRjvs9KrkFCDcQABoMMTg3MDE3MTUwOTg2IgxAB9wjRZqWH71RgBUqlgXwRLee1%2F2bwvrEX%2BjRChCRWDlayKpJMcrbJhMZuw5otkIi4ZIkCUVfK8EjsIS2Hko9cq7vVdPgyKKgAshtxwIghe%2B6CPR9gvezm8uFwSXPmiOGlGHKXP1njfFPhCKep5LAy%2Bm47HKDGR2Pf1nasRQc4xY6m%2BJa0mDo0JfXJKOOXFLS%2F%2BEtjSClD2BzM1nMwZoLGPpegiSRcizrenXmT9Y%2FxhgBU%2BMWXIXWzdF1NWcC4LNCoyqDRBEhDm9ySC2vQlC4XjsZzMznT%2Fb2GVPz4qp5RSqiJhu696p9NjKEhWnWGDjpPjCf%2FJeIO3AgFuww96gDsyzdrgG41PErUteZRfX5prn%2BCoENNnDkudHLViN3tPaX%2FdI8dphReOqsUxsodn0ZwZDv8RLesYVkQAnOUgCnnP8%2F%2ByouHMMKijApUmaGr585j8zjV5rRSw3tDJm9Vj2GTEdCXicburkmNSH3oIsVTLelc%2F%2BSXjgHpjAL4SlzsaR55ufNo2bEv6H%2BZZUdI%2BN2x%2FMw8FzNYCaWJoDUeTRZx5eEutVviwyuJs4eGGXvCeJQKBcPV5mUz8zxxOYC%2F%2FIpE%2BDwHPfK7Tau%2Byp%2F3LnkVixeF398F4b%2BUeU7iLbrXt6IpJkjzsk6URA02qqf7kJoOFRIBWfITclLZOt%2B7c7%2BsN7aCQE%2F6iqSfPjGQxBBiDVTvGh0C%2FDb5GvZa%2FFt8isbI8PuXmz6RfY6nctI7fMSiWmxsWHC09JaFprW%2BO952mkiz6LSK9%2BDDLBDF5A7HzVSx%2Fqwsap%2Fqvoyr186tLxSJE1qTDMKy7UjIZMcwoko728ucj0fqpOu%2BfUNs8g%2BeRSdcyBHVeevxUd3vsGC2Kres973tizVE9eiBZ7LbB3jXnGhTBFfWDDVlMWqBjqwAXsaNRLWgT9NQMxDmt67INwVSn0yO%2F%2BhVxbE%2BPOvq7KpuQ5w3cDzE%2B4r2GBMTKLnXnpdNLR3avKhAhkE5w%2BWdEMpxvZJU1APXXqUSgtfUdnQYLcZB2uDKUQ%2Fk9iRK2XQPAxVN5xtloGWc01F4MWOOGt8tEtRWTtJnjC3cF7zoA7JSNU3v3xOxib1V8FoySDk1O%2Fat7OZuhPyoTUxxX8j%2FEXDqSdPcCQekne94EZ%2F5J94&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231112T222208Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFO2YZTAXC%2F20231112%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=965651894a86eaa7edee898acd6519161f5aa65938d07dc904dcaf17f2ab187f")
      expect(json[:data].first[:attributes].count).to eq(4)
    end
  end


end