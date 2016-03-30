
50.times do

  User.create!(username: Faker::Superhero.name, email: Faker::Internet.free_email, password: "password")


end

User.first.questions << Question.create!(title: Faker::Lorem.sentence(5), content: Faker::Lorem.paragraph(5))

Question.first.answers << Answer.create!(user: User.last, content: Faker::Lorem.sentence(2))

Question.first.votes << Vote.create!(user: User.last, vote_value: 1)

Question.first.comments << Comment.create!(content: "This rules!")

