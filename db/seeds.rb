# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!( id: 1,
              firstname: "example",
              lastname: "example",
              email: "example@email.com",
              tel: "01234567890",
              password: "1234",
              password_confirmation: "1234")
Pet.create!(name: "exmaple.pet",
            breed: "チワワ",
            sex: "オス",
            user_id: 1)