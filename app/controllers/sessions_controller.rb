class SessionsController < ApplicationController
  def new
  end

  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] ="Welcome to the E-learning!"
      log_in user
      redirect_to root_url
    else
      render 'new' 
      flash[:danger] ="invalid account!"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
