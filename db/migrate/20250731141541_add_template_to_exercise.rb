class AddTemplateToExercise < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :template, :boolean, default: false
  end
end
