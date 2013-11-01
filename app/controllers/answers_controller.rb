class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_question

  def create
    @answer = @question.answers.build(answer_params)
    @question = Question.find(params[:question_id])

    if @answer.save
      flash[:succes] = 'Your answer has been submited.'
      redirect_to @question
    else
      # @question = Question.find(params[:question_id])
      render 'questions/show'
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:body, :user_id)
    end
end
