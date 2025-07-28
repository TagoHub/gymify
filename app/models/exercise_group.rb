class ExerciseGroup < ApplicationRecord
  belongs_to :workout
  has_many :exercises, dependent: :destroy

  # attributes:
  # order Integer
  # superset Boolean

  def all_sets
    exercises.flat_map{ |e| e.exercise_sets }.sort_by{ |es| es.order}
  end
end
