class AddUserIdToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :user, index: true
  end
end
