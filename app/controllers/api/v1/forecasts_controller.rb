class Api::V1::ForecastsController < ApplicationController

  def show
    data = ForecastsFacade.new(params[:location])
    render json: ForecastsSerializer.new(data)
  end
end
