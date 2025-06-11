class Exercise < ApplicationRecord
  belongs_to :exercise_group
  belongs_to :instrument
  belongs_to :unit, optional: true
  has_many :exercise_sets, dependent: :destroy
  has_one_attached :image

  # attributes: 
  # name String
  # notes String
  # exercise_type String
  # min_reps Integer
  # max_reps Integer
  # rest_time Float
  # unilateral Boolean
end
