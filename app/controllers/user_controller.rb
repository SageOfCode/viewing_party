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
    friend = User.find_by(email: params[:user_email])
    if !friend
      flash[:notice] = "User does not Exist"
      redirect_to dashboard_path
    else
      current_user.add_friends(current_user.id, friend.id)
      redirect_to dashboard_path
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
