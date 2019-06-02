FactoryBot.define do
  factory :anna, class: User do
    email { "anna.dean@com.pl" }
    password { BCrypt::Password.create('abc123') }
  end

  factory :john, class: User do
    email { "john.doe@com.pl" }
    password { BCrypt::Password.create('password') }
  end
end