class CreateExerciseSets < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_sets do |t|
      t.string :set_type
      t.integer :reps
      t.float :load
      t.references :unit, null: false, foreign_key: true
      t.integer :intensity
      t.references :intensity_technique, null: true, foreign_key: true
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
