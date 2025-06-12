class Instrument < ApplicationRecord
  belongs_to :unit
  belongs_to :grip, optional: true
  has_many :exercises

  # attributes:
  # name String
end