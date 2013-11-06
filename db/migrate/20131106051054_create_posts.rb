class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id
      t.integer :bubble_id

      t.timestamps
    end
    add_index :posts, [:user_id, :bubble_id, :created_at]
  end
end
