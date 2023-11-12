class Api::V1::RecipesController < ApplicationController
  def search
    if params[:query].blank?
      render json: {
        "data": []
      }
    else
      recipes = RecipeFacade.search(params[:query])
      json = render json: RecipeSerializer.new(recipes)
    end
  end

  def random_search
    recipes
  end
end 