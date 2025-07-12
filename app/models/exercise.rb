class Exercise < ApplicationRecord
  belongs_to :exercise_group
  belongs_to :instrument
  belongs_to :unit, optional: true
  belongs_to :attachment, optional: true
  belongs_to :grip, optional: true
  has_many :exercise_sets, dependent: :destroy
  has_one_attached :image

  def max_load
    working_sets.maximum(:load)
  end

  def max_reps
    working_sets.maximum(:reps)
  end

  def maxed_rep_range?
    working_sets.pluck(:reps).all?{ |r| r >= rep_range_max }
  end

  def same_reps?
    working_sets.pluck(:reps).uniq.count == 1
  end

  def working_sets
    exercise_sets.where(set_type: "Working Set").order(:order)
  end

  # attributes: 
  # name String
  # notes String
  # exercise_type String
  # min_reps Integer
  # max_reps Integer
  # rest_time Float
  # unilateral Boolean
end
