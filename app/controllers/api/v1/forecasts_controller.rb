class Api::V1::ForecastsController < ApplicationController

  def show
    data = ForecastsFacade.new(params[:location])
    render json: ForecastSerializer.new(data)
  end
end
