
25.times do

User.create!(name: Faker::Superhero.name, email: Faker::Internet.free_email, password: "password")
end

25.times do

User.find((1..User.count).to_a.sample).questions << Question.new(title: Faker::Hipster.sentence(5), content: Faker::Hipster.paragraph(5))

end

100.times do
Question.find((1..Question.count).to_a.sample).answers << Answer.create!(user: User.find((1..User.count).to_a.sample), content: Faker::Hacker.say_something_smart)
end

100.times do
Answer.find((1..Answer.count).to_a.sample).votes << Vote.new(user: User.find((1..User.count).to_a.sample), vote_value: 1)
end

