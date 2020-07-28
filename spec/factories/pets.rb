FactoryBot.define do
  factory :pet do
    id { '1' }
    name  { '桃太郎' }
    birthday { '20191004' }
    breed { 'チワワ' }
    sex { 'オス' }
    association :user
  end
end