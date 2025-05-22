class AuthController < ApplicationController
  skip_before_action :verify_authenticity_token

  def signup
  

  user = User.new(user_params)
  
  if user.save
    render json: { message: "Signup successful", user: user }, status: :created
  else
    render json: { message: user.errors.full_messages }, status: :unprocessable_entity
  end
end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
