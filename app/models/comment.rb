class Comment < ActiveRecord::Base
  belongs_to :answer
  has_many :commentables, dependent: :destroy
  has_many :replies, through: :commentables, source: :reply
end
