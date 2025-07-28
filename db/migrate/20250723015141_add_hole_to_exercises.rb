class AddHoleToExercises < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :hole, :integer
  end
end
