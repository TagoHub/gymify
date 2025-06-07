class CreateInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :instruments do |t|
      t.string :name
      t.float :weight
      t.string :unit

      t.timestamps
    end
  end
end
