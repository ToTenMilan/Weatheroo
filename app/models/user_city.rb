class UserCity < ApplicationRecord
  belongs_to :user
  belongs_to :city

  validates :user_id, uniqueness: { scope: :city_id, message: 'City for this user already exist' }
  validates :uid, presence: true
end
