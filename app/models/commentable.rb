class Commentable < ActiveRecord::Base
  belongs_to :comment
  belongs_to :reply, class_name: 'Comment'
end
