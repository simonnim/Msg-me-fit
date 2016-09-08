class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
    	t.string :meal
    	t.integer :user_id

      t.timestamps
    end
  end
end
