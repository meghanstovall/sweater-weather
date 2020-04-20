class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      response.status = :unauthorized
      error = "Bad Credentials"
      render json: ResponseSerializer.new(Response.new(response, error))
    end
  end
end
