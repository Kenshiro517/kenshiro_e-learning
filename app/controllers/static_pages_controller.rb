class StaticPagesController < ApplicationController
  def home
    if logged_in?
      render 'users/users_feeds'
    end
  end

  def about
  end
end
