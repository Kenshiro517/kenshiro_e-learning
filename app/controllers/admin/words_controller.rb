class Admin::WordsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user
  def index
    @category = Category.find(params[:category_id])
    @words = @category.words.paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    3.times{@word.choices.build}
  end
  
  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)
    if @word.save
      flash[:success] = "Successfully created words!"
      redirect_to admin_category_words_url
    else
      render'new'
    end
  end

  def edit
    @category = Category.find(id: params[:category_id])
    @word = Word.find(id: params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update_attributes(word_params)
      flash[:success] ="Successfully updated!"
      redirect_to admin_category_words_url
    else
      render 'edit'
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    flash[:danger] ="You deleted a category!"
    redirect_to admin_category_words_url
  end
 



  private
    def word_params
      params.require(:word).permit(:content, choices_attributes: [:id, :content, :correct])
    end

end
