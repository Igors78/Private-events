# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |n|
    name = Faker::Name.name
    User.create!(name: name)
  end
# Generate events for a subset of users.
users = User.order(:created_at).take(5)
2.times do
  description = Faker::ChuckNorris.fact
  location = Faker::Address.country
  date = Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)
  users.each { |user| user.events.create!(description: description,
                                          location: location,
                                          date: date) }
end 
