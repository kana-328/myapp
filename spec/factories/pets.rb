FactoryBot.define do
  factory :pet do
    id { '1' }
    name  { '桃太郎' }
    birthday { '20191004' }
    breed { 'チワワ' }
    sex { 'オス' }
    user_id { '1'}
    association :user
  end
end