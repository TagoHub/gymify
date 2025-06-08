class CreatePrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :frequency
      t.string :level
      t.string :goal
      t.integer :duration
      t.references :user, null: false, foreign_key: true
      t.references :unit

      t.timestamps
    end
  end
end
