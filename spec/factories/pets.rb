FactoryBot.define do
  factory :pet do
    name { 'pet.name' }
    birthday { 'birthday' }
    breed { 'breed' }
    sex { 'sex' }
    association :user
  end
end
