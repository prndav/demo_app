class Comment < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user

  validates_presence_of :body, :user_id, :answer_id
  validates_length_of :body, maximum: 1000
end
