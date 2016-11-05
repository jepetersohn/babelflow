require 'faker'

30.times do
  User.create!(username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "password")
end

japanese_question = Question.create!(title:"会者定離", body:"この4字熟語ってどう思うんですか", author_id:2)

german_question = Question.create!(title: "Hast du Hunger?", body: "Was ist dein Lieblingskäse? Hoffentlich nicht Emmentaler. Du kannst Emmentaler in deinen Arsch schieben!", author_id: 1)

Comment.create!(body: "Pues, me choca el queso; entonces no quiero el queso para nada. De la pregunta sobre el hambre, claro que sí.", author: User.find(rand(1..User.all.length)), commentable: german_question)

Answer.create!(body:"日本でうまいチーズないからあんまりチーズ食べないけど。。。", question_id:german_question.id, responder:User.find(rand(1..User.all.length)))

latin_answer = Answer.create!(body: "Nihil aeternam est", responder: User.find(rand(1..User.all.length)), question: japanese_question)

spanish_question = Question.create!(title: "Vamos a la playa o la piscina", body: "¿Cuáles personas quieren ir a la piscina? ¿O prefieren Uds. ir a la playa?", author: User.find(rand(1..User.all.length)))

Comment.create!(body: "Meine Beine sind zu haarig, dass ich etwas tun könnte...", author: User.find(rand(1..User.all.length)), commentable: spanish_question)
