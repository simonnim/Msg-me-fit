class CreateCalendar < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
    	t.integer :user_id, null: false
    	t.string :category, null: false
    	t.string :title, null: false
    	t.string :description
    	t.datetime :time
    	t.timestamps
    end
  end
end
