class CommentsController < ApplicationController
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
      params.require(:comment).permit(:body, :answer_id)
    end
end
