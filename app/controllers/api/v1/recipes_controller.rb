class Api::V1::RecipesController < ApplicationController
  def search
    if params[:country].present?
      recipes = RecipeFacade.search(params[:country])
      json = render json: RecipeSerializer.new(recipes)
    elsif params[:country].blank?
      country = RestCountriesService.random_country
      recipes = RecipeFacade.search(country)
      json = render json: RecipeSerializer.new(recipes)
    else
      render json: {
        "data": []
      }
    end
  end
end 