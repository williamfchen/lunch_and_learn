class Api::V1::LearningResourcesController < ApplicationController
  def show
    country = params[:country]
    video = LearningResourceFacade.get_video(country)
    images = LearningResourceFacade.get_images(country)

    response_body = {
      data: {
        id: nil,
        type: "learning_resource",
        attributes: {
          country: country,
          video: video,
          images: images
        }
      }
    }

    render json: response_body
  end
end
