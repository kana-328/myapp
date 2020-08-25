FactoryBot.define do
  factory :pet do
    name { 'pet.name' }
    birthday { '20200101' }
    breed { 'breed' }
    sex { 'sex' }
    image { 'image' }
    association :user
  end
end
