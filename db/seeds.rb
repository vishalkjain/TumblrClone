# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


 # 50.times do |i|
 #   User.create(email: Faker::Internet.safe_email,
 #               password: "password",
 #               username: Faker::Internet.user_name)
 # end
#
# User.all.each do |user|
#   user.posts.create(
#     title: Faker::Address.street_address,
#     body: Faker::Lorem.paragraph(sentence_count=10),
# end
#
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