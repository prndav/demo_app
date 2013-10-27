class AddLMarginToComments < ActiveRecord::Migration
  def change
    add_column :comments, :l_margin, :integer
  end
end
