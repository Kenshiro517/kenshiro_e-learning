class Admin::CategoriesController < ApplicationController

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
 
  def show
    @category = Category.find(params[:id])
  end


  private
    def category_params
      params.require(:category).permit(:title, :description)
    end



end
