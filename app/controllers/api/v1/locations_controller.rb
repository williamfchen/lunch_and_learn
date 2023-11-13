class Api::V1::LocationsController < ApplicationController
  def search
    results = LocationFacade.search(params[:category])
    render json: LocationSerializer.new(results)
  end
end 