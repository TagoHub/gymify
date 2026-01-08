class Exercise < ApplicationRecord
  belongs_to :exercise_group
  belongs_to :instrument
  belongs_to :unit, optional: true
  belongs_to :attachment, optional: true
  belongs_to :grip, optional: true
  has_many :exercise_sets, dependent: :destroy
  has_one_attached :image
  has_many :exercise_muscles, dependent: :destroy
  has_many :muscles, through: :exercise_muscles
  has_many :muscle_groups, through: :muscles
  belongs_to :primary_muscle_group, class_name: 'MuscleGroup', optional: true
  scope :template_exercises, -> { where(template: true) }

  def working_sets
    exercise_sets.where(set_type: "Working Set").order(:order)
  end

  def warmup_sets
    exercise_sets.where(set_type: "Warmup Set").order(:order)
  end

  # attributes: 
  # name String
  # notes String
  # exercise_type String
  # rep_range_min Integer
  # rep_range_max Integer
  # rest_time Float
  # unilateral Boolean
  # hole Integer
  # body_weight Boolean
  # template Boolean
end
