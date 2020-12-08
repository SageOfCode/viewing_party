class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    @user.update(role: 1)
    session[:user_id] = @user.id
    redirect_to '/dashboard'
  end

  def friends
    user = current_user
    friend = User.find_by(email: params[:email])
    user.add_friends(user.id, friend.id)
    redirect "/dashboard"
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
