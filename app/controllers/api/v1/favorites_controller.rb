class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])

    if user
      favorites = user.favorites
      render json: FavoriteSerializer.new(favorites), status: :ok
    else
      render json: { error: 'Invalid API key' }, status: :unauthorized
    end
  end
  
  def create
    user = User.find_by(api_key: params[:api_key])

    if user
      favorite = user.favorites.create(favorite_params)
      if favorite.save
        render json: { success: "Favorite added successfully" }, status: :created
      end
    else
      render json: { error: "Invalid API key" }, status: :unauthorized
    end
  end

  def destroy
    favorite = Favorite.find(params[:favorite_id])
    if favorite.user.api_key == params[:api_key]
      favorite.destroy
      render json: { message: 'Favorite successfully deleted' }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Favorite not found' }, status: :not_found
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end
