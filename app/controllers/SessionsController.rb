# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      render json: { user: { name: user.name, email: user.email } }, status: :ok
    else
      render json: { message: "Invalid email or password" }, status: :unauthorized
    end
  end
end
