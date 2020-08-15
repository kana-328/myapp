FactoryBot.define do
  factory :condition do
    vitality { "vitality" }
    defecation { "defecation" }
    urination { "urination" }
    appetite { "appetite" }
    vomit { "vomit" }
    weight { "weight" }
    comment { "comment" }
    staff { "staff" }
    medicine { "medicine" }
    recorded_at { "recorded_at" }
    recorded_date { '2020-01-01' }
    association :pet
  end
end
