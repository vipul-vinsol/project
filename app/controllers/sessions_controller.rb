class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password]) && user.active
      session[:user_id] = user.id
      redirect_to root_url, notice: "Successfully logged in"
    else
      flash[:notice] = "Invalid Email or password or account might not be active"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
