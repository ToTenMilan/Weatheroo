FactoryBot.define do
  factory :user_city do
    uid { 1 }
    association :user, factory: :john
    association :city, factory: :zion
  end
end
