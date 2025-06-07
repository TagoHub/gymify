class CreateExerciseSets < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_sets do |t|
      t.string :set_type
      t.integer :reps
      t.float :load
      t.string :unit
      t.integer :intensity
      t.string :intensity_technique
      t.references :exercise, null: false, foreign_key: true
      t.references :intensity_technique, foreign_key: true

      t.timestamps
    end
  end
end
