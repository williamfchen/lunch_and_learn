Rails.application.routes.draw do
  get '/api/v1/recipes', to: 'api/v1/recipes#search'

  get '/api/v1/tourist_sites', to: 'api/v1/tourist_sites#search'
end
