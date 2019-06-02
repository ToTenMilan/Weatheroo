FactoryBot.define do
  factory :zion, class: City do
    uid { 1 }
    name { "Zion" }
    country { "UW" }
    latitude { 1.5 }
    longitude { 1.5 }
  end

  factory :warszawa, class: City do
    uid { 6695624 }
    name { 'Warszawa' }
    country { 'PL' }
    latitude { 52.2355 }
    longitude { 21.0419 }
  end
end
