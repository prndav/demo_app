class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.includes(:user, :answers).desc_order.paginate(page: params[:page], per_page: 5)
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      flash[:success] = 'Your question was posted.'
      redirect_to @question
    else
      @questions = Question.all.desc_order.paginate(page: params[:page], per_page: 5)
      render 'index'
    end
  end

  def show
    @question = Question.includes(answers: [:comments, :user]).find(params[:id])
    @answer = Answer.new
    @comment = Comment.new
  end

  private

    def question_params
      params.require(:question).permit(:title, :body, :user_id)
    end

end
