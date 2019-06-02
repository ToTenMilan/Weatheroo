FactoryBot.define do
  factory :city do
    uid { 1 }
    name { "MyString" }
    country { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
