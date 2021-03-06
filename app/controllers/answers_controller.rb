class AnswersController < ApplicationController

  before_action :logged_in_user

  def new
    @answer = Answer.new
    @lesson = Lesson.find(params[:lesson_id])
    @category = Category.find_by(id: @lesson.category_id)

    if @lesson.next_word.nil?
      @lesson.update(result: @lesson.lesson_results)
      @lesson.create_activity(user: current_user)
      redirect_to lesson_url(@lesson)
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.build(answer_params)
    if @answer.save
      redirect_to new_lesson_answer_url(@lesson)
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:word_id, :choice_id)
    end

end
