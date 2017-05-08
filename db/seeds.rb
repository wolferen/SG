# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all
  User.create(
  first_name: 'vlad',
  last_name: "dem",
  username: "wolferen",
  email: 'veliar.master@gmail.com',
  birthday: '20.08.1994',
  password: '12345678'
  )

50.times do |count|
  user = User.create(
  first_name: "name#{count}",
  last_name: "last_name#{count}",
  username: "user#{count}",
  email: "sg#{count}@gmail.com",
  password: '12345678',
  birthday: (Date.today - 18.years)
  )

  user.posts.create(
  title: "i'm belong to user #{user.id}",
  body: "YE BABY ITS BODY TIME",
  published_at: Time.now
  )
end
