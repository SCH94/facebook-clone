# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

100.times do |i|
  puts "Creating a user - #{i}"
  gender = "Female"
  if i.even?
    gender = "Male"
  end
  User.create(name: Faker::Name.first_name, surname: Faker::Name.last_name, email: "my_email_#{i}@gmail.com", gender: gender, password: "aoeuaoeu")
  #User.create!(name: "Adam", surname: "Pallozzi", email: "adam#{i}@gmail.com", gender: "Male")
  
end