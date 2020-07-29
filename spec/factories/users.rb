FactoryBot.define do
  factory :user do
    id { '1' }
    firstname { '山田' }
    lastname { '太郎' }
    email { 'foobar@email.com' }
    password { 'foobar' }
    password_confirmation { 'foobar' }
    address { '〇〇県〇〇市〇〇町○-○-○' }
    tel { '01234567890' }
  end
end
