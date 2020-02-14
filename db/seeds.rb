# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
  user = User.create(username: Faker::Internet.username, password: Faker::Internet.password)
  pet1 = Pet.create(name: Faker::Creature::Dog.name, kind: "dog", age_in_years: 1, user_id: user.id)
  pet2 = Pet.create(name: Faker::Creature::Cat.name, kind: "cat", age_in_years: 1, user_id: user.id)

  puts "Created user #{user.username} with pets: #{pet1.name} & #{pet2.name}"
end