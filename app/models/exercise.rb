class Exercise < ApplicationRecord
  belongs_to :exercise_group
  belongs_to :instrument
  belongs_to :unit, optional: true
  belongs_to :attachment, optional: true
  belongs_to :grip, optional: true
  has_many :exercise_sets, dependent: :destroy
  has_one_attached :image

  def max_load
    self.exercise_sets.maximum(:load)
  end

  def max_rep
    self.exercise_sets.where(set_type: "Working Set").maximum(:reps)
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
