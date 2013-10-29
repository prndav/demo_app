class Comment < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user
  has_many :commentables
  has_many :replies, through: :commentables, source: :reply

  validates_presence_of :body, :user_id, :answer_id
  validates_length_of :body, maximum: 1000, message: "less than 1000 if you don't mind"
end
