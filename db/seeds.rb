
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

200.times do
Answer.find((1..Answer.count).to_a.sample).comments << Comment.new(user: User.find((1..User.count).to_a.sample), content: Faker::Hacker.say_something_smart)
end

100.times do
Comment.find((1..Comment.count).to_a.sample).votes << Vote.new(user: User.find((1..User.count).to_a.sample), vote_value: 1)
end


emily = User.create!(name: "Claire", email: "emily@emily.com", password: "password")

seed_users = []
 5.times do
  seed_users << User.create!(name: Faker::Superhero.name, email: Faker::Internet.free_email, password: "password")
end

quest1 = Question.create!(title: "How should I insult my DBC instructor?", content: "He's got a beard and glasses. Is four-eyes still a thing? Halp, plz.", user_id: emily.id)

ans1 = Answer.create!(content: "Tell him that the stick up his ass has a stick up it's ass.", user_id: seed_users.sample.id)
ans2 = Answer.create!(content: "Is he a ginger? He sounds like a ginger. Go after that." ,user_id: seed_users.sample.id)
ans3 = Answer.create!(content: "Don't you have better things to do than insult your instructors? For what you're paying, you don't have a lot of time to fuck around. Do you need something to do?", user_id: seed_users.sample.id)

com1 = Comment.create!(content: "Nah, only the beard. Good thinking, though!", user_id: emily.id, commentable_type: "Answer", commentable_id: ans2.id)


  Vote.create!(votable_type: "Question", votable_id: quest1.id, vote_value: 50, user_id: emily.id)
