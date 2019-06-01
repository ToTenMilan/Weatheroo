FactoryBot.define do
  factory :user do
    email { "john.doe@com.pl" }
    password { BCrypt::Password.create('password') }
  end
end