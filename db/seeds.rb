# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create!(name: "Adam", surname: "Pallozzi", email: "adampallozzi@gmail.com", password: "aoeuaoeu", gender: "Male")

require 'faker'

100.times do |i|
  gender = "Female"
  if i.even?
    gender = "Male"
  end
  fname = Faker::Name.first_name
  lname = Faker::Name.last_name
  u = User.create(name: fname, surname: lname, email: "#{fname}_#{lname}_#{i}@gmail.com", gender: gender, password: "aoeuaoeu")
end

347.times do 
  number = rand(9)
  random_user = User.offset(rand(User.count)).first
  
  if number.even?
    random_user.posts.create!(content: Faker::ChuckNorris.fact)
  else 
    random_user.posts.create!(content: Faker::HowIMetYourMother.quote)
  end

end