class Api::V1::AntipodesController < ApplicationController

  def show
    data = AtipodesFacade.get_antipode(params[:location])
    render json: AntipodesSerializer.new(data)
  end
end
