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

10.times do
  topic = Topic.new
  topic.title = Faker::Hipster.word
  while Topic.where(title: topic.title).exists?
    topic.title = Faker::Hipster.word
  end
  topic.user = users.sample
  topic.save
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

3.times do
  topic = Topic.create!(
    title: Faker::Hipster.word,
    user_id: "6"
  )
end

topic = Topic.create!(
  title: "no topic",
  user_id: "6"
)

3.times do
  topic = Topic.create!(
    title: Faker::Hipster.word,
    user_id: "7"
  )
end

topics = Topic.all

50.times do
  bookmark = Bookmark.create!(
    url: Faker::Internet.url,
    description: Faker::Hipster.sentence(4, false, 5),
    user: users.sample,
    topic: topics.sample
  )
end

20.times do
  bookmark = Bookmark.create!(
    url: Faker::Internet.url,
    description: Faker::Hipster.sentence(4, false, 5),
    user: me,
    topic: topics.sample
  )
end

20.times do
  bookmark = Bookmark.create!(
    url: Faker::Internet.url,
    description: Faker::Hipster.sentence(4, false, 5),
    user: member,
    topic: topics.sample
  )
end

puts "Seed finished!"
puts "Blocmarks was populated with #{User.count} new users."
puts "Blocmarks was populated with #{Topic.count} new topics."
puts "Blocmarks was populated with #{Bookmark.count} new bookmarks."
