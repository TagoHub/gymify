class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :programs, dependent: :destroy
  belongs_to :weight_unit, class_name: "Unit", optional: true
  belongs_to :height_unit, class_name: "Unit", optional: true
end
