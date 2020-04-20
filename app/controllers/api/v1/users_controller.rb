class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(user)
    else
      response.status = :not_acceptable
      errors = user.errors.full_messages.to_sentence
      render json: ResponseSerializer.new(Response.new(response, errors))
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
