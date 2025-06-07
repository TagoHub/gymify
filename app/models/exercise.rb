class Exercise < ApplicationRecord
  belongs_to :exercise_group
  belongs_to :instrument
  has_many :exercise_sets, dependent: :destroy

  # attributes: 
  # name String
  # notes String
  # exercise_type String
  # min_reps Integer
  # max_reps Integer
  # rest_time Float
  # unilateral Boolean
end