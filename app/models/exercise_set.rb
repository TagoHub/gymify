class ExerciseSet < ApplicationRecord
  belongs_to :unit
  belongs_to :intensity_technique, optional: true
  belongs_to :exercise

  # attributes: 
  # set_type String
  # reps Integer
  # load Float
  # intensity Integer
end
