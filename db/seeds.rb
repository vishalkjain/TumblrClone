# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


5.times do |i|
   User.create(email: Faker::Internet.safe_email,
               password: "password",
               username: Faker::Internet.user_name)
end

User.all.each do |user|
  user.posts.create(
    title: Faker::Lorem.word,
    body: Faker::Lorem.paragraph(sentence_count = 10) )
end


u = User.create(email: "demo1@example.com", password: "password", username: "DemoUser1")
u2 = User.create(email: "demo2@example.com", password: "password", username: "DemoUser2")
u3 = User.create(email: "demo3@example.com", password: "password", username: "DemoUser3")
u4 = User.create(email: "demo4@example.com", password: "password", username: "DemoUser4")

u.posts.create(title: "My first post", body: "I am DemoUser1 and I wrote this. Feels good")
u.posts.create(title: "My second post", body: "I am DemoUser1 and I wrote this. This is my second post")
u.posts.create(title: "My third post", body: "I am DemoUser1 and I wrote this. This is my third post")
u2.posts.create(title: "My first post", body: "I am DemoUser2 and I wrote this. Feels even better")
u3.posts.create(title: "My first post", body: "I am DemoUser3 and I wrote this. Trying out this whole tumblr thing")
u3.posts.create(title: "My second post", body: "I am DemoUser3 and I wrote this. This is my second post")
u4.posts.create(title: "My first post", body: "I am DemoUser4 and I wrote this. Thanks for following me")


Follow.create(user_id: u.id, follow_id: u2.id)
Follow.create(user_id: u.id, follow_id: u3.id)
Follow.create(user_id: u2.id, follow_id: u.id)


# i = User.first.id
#
# while i < User.last.id do
#   if (i % 3 == 0)
#     user = User.find(i)
#     user.petitions.create(
#       title: Faker::Company.catch_phrase,
#       body: Faker::Lorem.paragraph(3),
#       background: Faker::Lorem.paragraph(6))
#   end
#
#   i += 1
# end