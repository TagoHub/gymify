class CreateMuscles < ActiveRecord::Migration[7.1]
  def change
    create_table :muscles do |t|
      t.string :name
      t.references :muscle_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
