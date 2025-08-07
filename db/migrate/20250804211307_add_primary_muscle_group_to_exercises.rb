class AddPrimaryMuscleGroupToExercises < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :primary_muscle_group_id, :integer
  end
end
