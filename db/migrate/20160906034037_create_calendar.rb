class CreateCalendar < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
    	t.integer :user_id, null: false
    	t.integer :meal_id
    	t.integer :workout_id
    	t.datetime :time, null: false
    	t.timestamps
    end
  end
end
