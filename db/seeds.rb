
50.times do

  User.create!(name: Faker::Superhero.name, email: Faker::Internet.free_email, password: "password")




end
