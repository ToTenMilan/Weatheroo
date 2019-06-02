class User < ApplicationRecord
  has_secure_password

  has_many :user_cities, -> { joins(:city).includes(:city)}, dependent: :destroy
  has_many :cities, through: :user_cities

  validates :email, presence: true, uniqueness: true
end
