class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:success] = 'Your question was posted.'
      redirect_to :back
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  private

    def question_params
      params.require(:question).permit(:title, :body)
    end
end
