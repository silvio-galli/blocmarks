# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do
  user = User.create!(
    user_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
end

users = User.all

20.times do
  topic = Topic.create!(
    title: Faker::Hipster.word,
    user: users.sample
  )
end

me = User.create!(
  user_name:          "Fake",
  email:              "fake@example.com",
  password:           "password"
)

member = User.create!(
  user_name:          "Member User",
  email:              "member@example.com",
  password:           "password"
)

10.times do
  topic = Topic.create!(
    title: Faker::Hipster.word,
    user_id: "6"
  )
end

10.times do
  topic = Topic.create!(
    title: Faker::Hipster.word,
    user_id: "7"
  )
end

puts "Seed finished!"
puts "Blocmarks was populated with #{User.count} new users."
puts "Blocmarks was populated with #{Topic.count} new topics."
