class Workout < ApplicationRecord
  belongs_to :program
  has_many :exercise_groups, dependent: :destroy
  has_many :exercises, through: :exercise_groups

  def max_sets_count type
    exercises.map{ |e| e.send(type).count }.max || 0
  end

  # attributes: 
  # name String
  # goal String
  # rest_days Integer
end