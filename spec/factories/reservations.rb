FactoryBot.define do
  factory :reservation do
    start { "2020-01-01" }
    title { "ホテル" }
    association :pet
  end
end
