class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :comment_id

      t.timestamps
    end
    add_index :comments, :post_id
    add_index :comments, :comment_id
  end
end
