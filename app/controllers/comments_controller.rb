class CommentsController < ApplicationController
  before_action :authenticate_user!, :set_answer

  def create
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.build(comments_params)

    if @comment.save
      flash[:succes] = 'Your comment was submitted'
      redirect_to :back
    else
      flash[:error] = 'Your comment was not submitted'
      redirect_to :back
    end

  end

  def new
    @comment = Comment.new
    @parent = Comment.find(params[:comment_id]) if params[:comment_id]

    respond_to do |format|
      format.js
    end
  end

  private

    def comments_params
      params.require(:comment).permit(:body, :answer_id, :l_margin, :user_id, :parent_id)
    end

end
