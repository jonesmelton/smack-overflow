emily = User.create!(name: Claire, email: emily@emily.com, password: "password")

seed_users = 5.times do
  User.create!(name: Faker::Superhero.name, email: Faker::Internet.free_email, password: "password")
end

quest1 = Question.create!(title: "How should I insult my DBC instructor?" content: "He's got a beard and glasses. Is four-eyes still a thing? Halp, plz.", user_id: emily.id)

ans1 = Answer.create!(content: "Tell him that the stick up his ass has a stick up it's ass." user_id: seed_users.sample.id)
ans2 = Answer.create!(content: "Is he a ginger? He sounds like a ginger. Go after that." user_id: seed_users.sample.id)
ans3 = Answer.create!(content: "Don't you have better things to do than insult your instructors? For what you're paying, you don't have a lot of time to fuck around. Do you need something to do?" user_id: seed_users.sample.id)

com1 = Comment.create!(content: "Nah, only the beard. Good thinking, though!" user_id: emily.id, commentable_type: "Answer", commentable_id: ans2.id)


  Vote.create!(voteable_type: "Question", votable_id: quest1.id, vote_value: 50, user_id: emily.id)
