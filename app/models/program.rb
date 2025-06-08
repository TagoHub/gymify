class Program < ApplicationRecord
  belongs_to :user
  has_many :workouts, dependent: :destroy
  belongs_to :unit, optional: true

  # attributes: 
  # name String
  # frequency Integer
  # level String
  # goal String
  # min_time Integer
  # max_time Integer
end