module CommentsHelper
  def has_replies?(comment)
    comment.replies.any?
  end

  def render_comments_for(answer, &blk)
    answer.comments.each do |comment|
      show_reply(comment, &blk) unless Commentable.find_by_reply_id(comment.id)
    end
  end

  def show_reply(comment, &blk)
    blk.call(comment)

    if comment.replies.any?
      comment.replies.each do |re|
        show_reply(re, &blk)
      end
    else
      return
    end

  end

end


