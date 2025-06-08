class ExerciseGroup < ApplicationRecord
  belongs_to :workout
  has_many :exercises, dependent: :destroy

  # attributes:
  # order Integer
  # superset Boolean
end
