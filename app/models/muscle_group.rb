class MuscleGroup < ApplicationRecord
  has_many :muscles, dependent: :destroy

  # attributes:
  # name String
end