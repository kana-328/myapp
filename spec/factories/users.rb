FactoryBot.define do
  factory :user do
    firstname { "firstname" }
    lastname { "lastname" }
    sequence(:email) { |n| "example#{n}@example.com" }
    password { 'foobar' }
    password_confirmation { password }
    address { '〇〇県〇〇市〇〇町○-○-○' }
    tel { '01234567890' }
  end

  factory :admin, class: "User" do
    firstname { "firstname" }
    lastname { "lastname" }
    email { "example-admin@example.com" }
    password { 'foobar' }
    password_confirmation { password }
    address { '〇〇県〇〇市〇〇町○-○-○' }
    tel { '01234567890' }
  end
end
