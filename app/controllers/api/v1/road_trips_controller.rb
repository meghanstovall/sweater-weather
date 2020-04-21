class Api::V1::RoadTripsController < ApplicationController

  def create
    if params[:api_key].empty? || !User.exists?(api_key: params[:api_key])
      response.status = :unauthorized
      render json: ResponseSerializer.new(Response.new(response))
    else
      render json: RoadTripSerializer.new(RoadTripsFacade.new(params[:origin], params[:destination], params[:api_key]))
    end
  end
end
