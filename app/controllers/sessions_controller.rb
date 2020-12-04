class SessionsController < ApplicationController
  def new

  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/dashboard"
      flash[:notice] = "You're logged in as #{current_user.email}"
    else
      flash[:notice] = "Email or Password is incorrect."
      render :new
    end
  end
end
