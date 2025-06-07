class CreatePrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :frequency
      t.string :level
      t.string :goal
      t.integer :minutes_min
      t.integer :minutes_max
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
