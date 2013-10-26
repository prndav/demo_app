class CreateCommentables < ActiveRecord::Migration
  def change
    create_table :commentables do |t|
      t.references :comment, index: true
      t.references :reply, index: true

      t.timestamps
    end
  end
end
