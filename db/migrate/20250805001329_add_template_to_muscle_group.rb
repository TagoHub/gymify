class AddTemplateToMuscleGroup < ActiveRecord::Migration[7.1]
  def change
    add_column :muscle_groups, :template, :boolean, default: false
  end
end
