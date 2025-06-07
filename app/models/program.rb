class Program < ApplicationRecord
  belongs_to :user
  has_many :workouts, dependent: :destroy

  # attributes: 
  # name String
  # frequency Integer
  # level String
  # goal String
  # min_time Integer
  # max_time Integer
end