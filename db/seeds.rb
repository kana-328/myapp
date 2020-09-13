User.create!( firstname: "example",
              lastname: "example",
              email: "example@email.com",
              tel: "01234567890",
              address: "example",
              password: "1234",
              password_confirmation: "1234",
              admin: true)

  30.times do |n|
    User.create!(firstname: "hoge",
                  lastname: "foo",
                  email: "example#{n + 1}@example.com",
                  tel: "01234567890",
                  address: "address",
                  password: '1234',
                  password_confirmation: '1234')
  end

