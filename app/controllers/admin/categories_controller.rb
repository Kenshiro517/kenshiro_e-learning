class Admin::CategoriesController < ApplicationController

  before_action :logged_in_user
  before_action :admin_user 

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)    # Not the final implementation!
    if @category.save
      flash[:success] ="You successfully made the category! "
      redirect_to admin_categories_url
    else
      render 'new'
    end
  end  

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end
 
  private
    def category_params
      params.require(:category).permit(:title, :description)
    end 

end
