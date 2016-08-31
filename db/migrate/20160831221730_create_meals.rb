class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|

      t.timestamps
    end
  end
end
