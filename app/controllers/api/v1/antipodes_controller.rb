class Api::V1::AntipodesController < ApplicationController

  def show
    data = AntipodesFacade.new(params[:location])
    render json: AntipodesSerializer.new(data)
  end
end
