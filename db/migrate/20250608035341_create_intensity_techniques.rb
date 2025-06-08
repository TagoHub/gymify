class CreateIntensityTechniques < ActiveRecord::Migration[7.1]
  def change
    create_table :intensity_techniques do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
