# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 5.times do

#   post = Post.create(
#       title: Faker::Book.title,
#       body: Faker::Hipster.paragraph
#   )
# end
#
#
#
# 5.times do
#
#   user = User.create(
#       name: Faker::Book.author,
#       email: Faker::Internet.email,
#       bio: Faker::Hipster.paragraph
#   )


10.times do
  User.create!(
      email: Faker::Internet.email,
      password: Faker::LordOfTheRings.character + Faker::Pokemon.name + rand(100 .. 999).to_s
  )
end

users = User.all
50.times do
  Post.create!(
      author: users.sample,
      title: Faker::Company.catch_phrase,
      body: Faker::Hipster.paragraph
  )

end