class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :comments, dependent: :destroy

  validates_presence_of :body

  # accepts_nested_attributes_for :comments
end
