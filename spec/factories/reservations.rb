FactoryBot.define do
  factory :reservation do
    start_date { "2020-01-01 01:29:01" }
    end_date   { "2020-01-25 01:29:01" }
    title      { "ホテル" }
    association :pet
  end
end
