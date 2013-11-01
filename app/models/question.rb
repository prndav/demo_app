class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :user

  scope :desc_order, -> {order('created_at DESC') }

  validates_presence_of :title, :body, :user_id
  validates_length_of :body, maximum: 1000
  validates_length_of :title, maximum: 100
end

