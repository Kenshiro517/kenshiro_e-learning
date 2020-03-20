class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  end
end
