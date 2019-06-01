class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true

  def self.authenticate(email, password)
    user = find_by(email: email)
    user if user && user.authenticate(password)
  end
end
