class QuestionsController < ApplicationController
  def index
    @questions = Question.all.paginate(page: params[:page], per_page: 5)
    @question = Question.new

  end

  def new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:success] = 'Your question was posted.'
      redirect_to @question
    else
      @questions = Question.all.paginate(page: params[:page], per_page: 5)
      render 'index'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @comment = Comment.new
  end

  private

    def question_params
      params.require(:question).permit(:title, :body)
    end

end
