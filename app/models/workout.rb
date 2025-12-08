class Workout < ApplicationRecord
  belongs_to :program
  has_many :exercise_groups, dependent: :destroy
  has_many :exercises, through: :exercise_groups

  def max_sets_count type
    exercises.map{ |e| e.send(type).count }.max || 0
  end

  def last_performed_at
    ex_ids = exercises.pluck(:id)
    ExerciseSet.where(exercise_id: ex_ids).maximum(:updated_at) || updated_at
  end

  # attributes: 
  # name String
  # goal String
  # rest_days Integer
end