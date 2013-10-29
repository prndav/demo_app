class AnswersController < ApplicationController
  before_filter :authenticate_user!, only: [:create]

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)

    if @answer.save
      flash[:succes] = 'Your answer has been submited.'
      redirect_to @question
    else
      @question = Question.find(params[:question_id])
      render 'questions/show'
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:body, :user_id)
    end
end
