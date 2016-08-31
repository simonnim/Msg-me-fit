class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|

      t.timestamps
    end
  end
end
