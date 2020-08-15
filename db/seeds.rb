User.create!( firstname: "example",
              lastname: "example",
              email: "example@email.com",
              tel: "01234567890",
              address: "example",
              password: "1234",
              password_confirmation: "1234",
              admin: true)
Pet.create!(name: "exmaple.pet",
            breed: "チワワ",
            sex: "オス",
            user_id: 1)

99.times do |n|
  firstname  = Faker::Name.first_name
  lastname  = Faker::Name.last_name
  email = Faker::Internet.email
  password = '1234'
  tel = '01234567890'
  address = Faker::Address.city
  User.create!( firstname:  firstname,
                lastname: lastname,
                email: email,
                password:              password,
                password_confirmation: password,
                tel: tel,
                address: address)
end

users = User.order(:created_at).take(6)
  3.times do
    name = Faker::Name.name
    breed = 'breed'
    sex = 'sex'
    users.each do |user|
      user.pets.create!(name: name,
                        breed: breed,
                        sex: sex )
  end
end