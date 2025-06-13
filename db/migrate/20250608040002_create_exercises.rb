class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :notes
      t.string :exercise_type
      t.integer :rep_range_min
      t.integer :rep_range_max
      t.integer :rest_time
      t.boolean :unilateral
      t.references :exercise_group, null: false, foreign_key: true
      t.references :instrument, null: false, foreign_key: true
      t.references :attachment, foreign_key: true
      t.references :grip, foreign_key: true
      t.references :unit

      t.timestamps
    end
  end
end
