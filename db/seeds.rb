
50.times do

  User.create!(username: Faker::Superhero.name, email: Faker::Internet.free_email, password: "password")




end
