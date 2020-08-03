FactoryBot.define do
  factory :user do
    firstname { '山田' }
    lastname { '太郎' }
    email { 'example@email.com' }
    password { 'foobar' }
    password_confirmation { password }
    address { '〇〇県〇〇市〇〇町○-○-○' }
    tel { '01234567890' }
  end
end
