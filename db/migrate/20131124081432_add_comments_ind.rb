class AddCommentsInd < ActiveRecord::Migration
  def change
  	add_column :posts, :comment_ind, :boolean
  end
end
