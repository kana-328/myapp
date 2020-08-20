FactoryBot.define do
  factory :body do
    weight { 1.5 }
    recorded_date { '2020-01-01' }
    association :pet
  end
end
