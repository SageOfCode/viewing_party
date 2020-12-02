class UserController < ApplicationController
  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to '/dashboard'
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end 
