
25.times do

  User.create!(name: Faker::Superhero.name, email: Faker::Internet.free_email, password: "password")


end

User.first.questions << Question.new(title: Faker::Lorem.sentence(5), content: Faker::Lorem.paragraph(5))

Question.first.answers << Answer.create!(user: User.last, content: Faker::Lorem.sentence(2))

Question.first.votes << Vote.new(user: User.last, vote_value: 1)

