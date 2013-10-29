class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_comment, only: [:new_comment, :new_reply]

  def create
    @answer = Answer.find(params[:comment][:answer_id])
    @comment = @answer.comments.build(comments_params)

    if @comment.save
      flash[:succes] = 'Your comment was submitted.'
      redirect_to :back
    else
      render 'questions/show'
    end

  end

  def new_comment
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def new_reply
    @reply_to = Comment.find(params[:id])
    @answer = @reply_to.answer

    respond_to do |format|
      format.js
    end

  end

  def create_reply
    @answer = Answer.find(params[:comment][:answer_id])
    @comment = Comment.find(params[:comment][:reply_id])
    @reply = @answer.comments.build(comments_params)


    if @comment.save
      @comment.replies << @reply
      flash[:succes] = 'Your reply was submitted.'
      redirect_to :back
    else
      render 'questions/show'
    end
  end

  private

    def comments_params
      params.require(:comment).permit(:body, :answer_id, :l_margin, :user_id)
    end

    def set_comment
      @comment = Comment.new
    end
end
