module AnswersHelper
  def has_comments?(answer)
    answer.comments.any?
  end
end
