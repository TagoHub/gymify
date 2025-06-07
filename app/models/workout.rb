class Workout < ApplicationRecord
  belongs_to :program
  has_many :exercise_groups, dependent: :destroy
  has_many :exercises, through: :exercise_groups

  # attributes: name, goal, rest_days
end