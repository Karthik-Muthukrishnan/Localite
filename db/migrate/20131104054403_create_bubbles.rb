class CreateBubbles < ActiveRecord::Migration
  def change
    create_table :bubbles do |t|
      t.column :pincode, "char(10)"
      t.string :name
      t.string :zone
      t.string :district
      t.string :state
      t.column :active_ind, "char(1)"

      t.timestamps
    end

  end
end
