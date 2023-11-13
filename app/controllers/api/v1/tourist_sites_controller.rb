class Api::V1::TouristSitesController < ApplicationController
  def search
    begin
      results = TouristSiteFacade.search(params[:country])
      render json: TouristSiteSerializer.new(results)
    rescue StandardError
      render json: { data: [] }, status: :not_found
    end
  end
end 