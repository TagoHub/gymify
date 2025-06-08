class Unit < ApplicationRecord
  has_many :programs
  has_many :exercises
  has_many :weight_users, class_name: "User", foreign_key: :weight_unit_id
  has_many :height_users, class_name: "User", foreign_key: :height_unit_id
  # attributes: 
  # name String
  # unit_type String
end
