class Instrument < ApplicationRecord
  belongs_to :unit
  has_many :exercises

  # attributes:
  # name String
end