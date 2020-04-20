class Api::V1::AntipodesController < ApplicationController

  def show
    data = AntipodesFacade.new(params[:location])
    render json: AntipodeSerializer.new(data)
  end
end
