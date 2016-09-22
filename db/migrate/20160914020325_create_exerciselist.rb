class CreateExerciselist < ActiveRecord::Migration[5.0]
  def change
    create_table :exerciselists do |t|
    	t.string :exercise, null: false
    	t.string :muscle, null: false
    end
  end
end
