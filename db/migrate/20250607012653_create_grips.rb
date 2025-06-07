class CreateGrips < ActiveRecord::Migration[7.1]
  def change
    create_table :grips do |t|
      t.string :name
      t.references :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
