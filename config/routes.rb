Rails.application.routes.draw do
  get '/api/v1/recipes', to: 'api/v1/recipes#search'
  get '/api/v1/learning_resources', to: 'api/v1/learning_resources#show'
end
