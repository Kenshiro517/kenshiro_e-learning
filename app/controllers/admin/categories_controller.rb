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
    @categories = Category.paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  end
 
  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] ="Successfully updated!"
      redirect_to admin_categories_url
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:danger] ="You deleted a category!"
    redirect_to admin_categories_url
  end
 
  private
    def category_params
      params.require(:category).permit(:title, :description)
    end 

end
