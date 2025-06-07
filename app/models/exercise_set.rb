class ExerciseSet < ApplicationRecord
  belongs_to :exercise
  belongs_to :intensity_technique, optional: true

  # attributes: 
  # set_type String
  # reps Integer
  # load Float
  # unit String
  # intensity Integer
end