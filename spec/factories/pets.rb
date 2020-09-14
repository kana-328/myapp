FactoryBot.define do
  factory :pet do
    name { 'pet.name' }
    birthday { '20200101' }
    breed { 'breed' }
    sex { 'sex' }
    association :user
  end

  factory :other_pet, class: "Pet" do
    name { 'other_pet.name' }
    birthday { '20200101' }
    breed { 'other_pet.breed' }
    sex { 'other_pet.sex' }
    association :user
  end
end
