class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
    	t.string :workout
    	t.integer :sets
    	t.integer :reps
    	t.integer :weight
    	t.integer :user_id

      t.timestamps
    end
  end
end
