class AddBodyWeightToExercise < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :body_weight, :boolean, default: false
  end
end
