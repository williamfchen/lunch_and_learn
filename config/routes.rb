Rails.application.routes.draw do
  get '/api/v1/recipes/search', to: 'api/v1/recipes#search'
end
