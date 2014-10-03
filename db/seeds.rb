require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create a member
member = User.new(
  name:       'Member User',
  email:      'member@example.com',
  password:   'password',
  )
member.skip_confirmation!
member.save!

16.times do
  stack = Stack.new(
    title: Faker::Lorem.word,
    description: "Modi aut animi consequuntur qui tempora aspernatur aperiam. Consequuntur minima tenetur iure quae. Voluptas optio consequatur harum. Architecto quaerat similique repellendus consequatur aut quo animi."
    )
  stack.save
end

5.times do 
  user = User.new(
    name:       Faker::Name.name,
    email:      Faker::Internet.email,
    password:   Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save
end
users = User.all

75.times do
  note = Note.new(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    user: users.sample
    )
  note.save
end



puts "Seed finished"
puts "#{Stack.count} stacks created"
puts "#{User.count} users created"
puts "#{Note.count} notes created"
