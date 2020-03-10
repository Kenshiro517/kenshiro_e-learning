class StaticPagesController < ApplicationController
  def home
    if logged_in?
      render 'users/users_feeds.html.erb'
    end
  end

  def about
  end
end
