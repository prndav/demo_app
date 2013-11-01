module CommentsHelper

  def show_reply(comments, comment, &blk)
    blk.call(comment)

    if comments[comment.id]
      comments[comment.id].each do |re|
        show_reply(comments, re, &blk)
      end
    else
      return
    end

  end

  def get_comments_for(answer)
    answer.comments.group_by {|c| c.parent_id }
  end

  def render_comments_for(answer, &blk)
    comments = get_comments_for(answer)

    unless comments.empty?
      comments[0].each do |comment|
        show_reply(comments, comment, &blk)
      end
    end
  end

end


