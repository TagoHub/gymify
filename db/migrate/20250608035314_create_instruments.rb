class CreateInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :instruments do |t|
      t.string :name, null: false
      t.float :weight
      t.references :unit, null: false, foreign_key: true
      t.references :grip, foreign_key: true
      t.references :attachment, foreign_key: true
      t.timestamps
    end
  end
end