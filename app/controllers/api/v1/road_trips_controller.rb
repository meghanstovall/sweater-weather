class Api::V1::RoadTripsController < ApplicationController

  def create
    render json: RoadTripSerializer.new(RoadTripsFacade.new(params[:origin], params[:destination], params[:api_key]))
  end
end
