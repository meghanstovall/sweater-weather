class Api::V1::BackgroundsController < ApplicationController

  def show
    data = BackgroundsFacade.new(params[:location])
    render json: BackgroundSerializer.new(data)
  end
end
