class CreateStats < ActiveRecord::Migration[5.0]
  def change
    create_table :stats do |t|
    	t.integer :weight, null: false
    	t.integer :bench, null: false
    	t.integer :squat, null: false
    	t.integer :deadlift, null: false
    	t.integer :overheadpress, null: false
    	t.integer :barbellrow, null: false
        t.integer :user_id, null: false

        t.timestamps
    end
  end
end
