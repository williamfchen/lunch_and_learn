Rails.application.routes.draw do
  get '/api/v1/recipes', to: 'api/v1/recipes#search'
end
