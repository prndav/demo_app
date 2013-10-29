class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates_presence_of :body, :user_id, :question_id
  validates_length_of :body, maximum: 1000, message: "less than 1000 if you don't mind"
end
