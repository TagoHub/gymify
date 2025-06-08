class CreateExerciseGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_groups do |t|
      t.references :workout, null: false, foreign_key: true
      t.integer :order
      t.boolean :superset

      t.timestamps
    end
  end
end
