class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @activities = Activity.where("user_id IN (?) OR user_id = ?",current_user.followings.ids,current_user.id).paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
      render 'users/users_feeds'
    end
  end
  
  def about
  end
end


