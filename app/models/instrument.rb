class Instrument < ApplicationRecord
  has_many :exercises
  has_many :grips, dependent: :destroy

  # attributes:
  # name String
end