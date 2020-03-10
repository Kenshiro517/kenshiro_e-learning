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
      flash[:danger] ="Invalid account!"
      render 'new' 
      
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
