class CreateUserBubbleRelations < ActiveRecord::Migration
  def change
    create_table :user_bubble_relations do |t|
      t.integer :user_id
      t.integer :bubble_id

      t.timestamps
    end
  end
end
