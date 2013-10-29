class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :user

  default_scope -> { order('created_at DESC') }

  validates_presence_of :title, :body, :user_id
  validates_length_of :body, maximum: 1000, message: "less than 1000 if you don't mind"
  validates_length_of :title, maximum: 100, message: "less than 100 if you don't mind"
end

