class Api::V1::LearningResourcesController < ApplicationController
  def show
    country = params[:country]
    video = LearningResourceFacade.get_video(country)
    images = LearningResourceFacade.get_images(country)

    learning_resource = {
      country: country,
      video: video,
      images: images
    }
    
    render json: LearningResourceSerializer.new(learning_resource)
  end
end
