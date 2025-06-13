class AddSuggestedIntensityToExerciseSets < ActiveRecord::Migration[7.1]
  def change
    add_column :exercise_sets, :suggested_intensity, :integer
  end
end
