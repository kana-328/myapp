FactoryBot.define do
  factory :user do
    firstname { "firstname" }
    lastname { "lastname" }
    email { "example@example.com" }
    password { 'foobar' }
    password_confirmation { password }
    address { '〇〇県〇〇市〇〇町○-○-○' }
    tel { '01234567890' }
    admin { false }
  end

  factory :admin, class: "User" do
    firstname { "firstname" }
    lastname { "lastname" }
    email { "example-admin@example.com" }
    password { 'foobar' }
    password_confirmation { password }
    address { '〇〇県〇〇市〇〇町○-○-○' }
    tel { '01234567890' }
    admin { true }
  end
end
