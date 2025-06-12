class AddAttachmentIdToExercises < ActiveRecord::Migration[7.1]
  def change
    add_reference :exercises, :attachment, null: true, foreign_key: true
  end
end
