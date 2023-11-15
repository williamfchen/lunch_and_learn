Rails.application.routes.draw do
  get '/api/v1/recipes', to: 'api/v1/recipes#search'
  get '/api/v1/learning_resources', to: 'api/v1/learning_resources#show'

  post "/api/v1/users", to: "api/v1/users#create"
  post "/api/v1/sessions", to: "api/v1/sessions#create"

  get 'api/v1/favorites', to: 'api/v1/favorites#index'
  post 'api/v1/favorites', to: 'api/v1/favorites#create'
  delete 'api/v1/favorites', to: 'api/v1/favorites#destroy'
end
