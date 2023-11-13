class Api::V1::RecipesController < ApplicationController
  def search
    if params[:country].present?
      recipes = RecipeFacade.search(params[:country])
      json = render json: RecipeSerializer.new(recipes, country: params[:country])
    elsif params[:country].blank?
      country = RestCountriesService.random_country
      recipes = RecipeFacade.search(country)
      render json: RecipeSerializer.new(recipes, country: country)
    end
  end
end