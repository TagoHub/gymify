class AddGripIdToExercises < ActiveRecord::Migration[7.1]
  def change
    add_reference :exercises, :grip, null: true, foreign_key: true
  end
end
