module QuestionsHelper
  def has_answers?(question)
    question.answers.any?
  end
end
