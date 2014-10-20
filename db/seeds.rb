require 'faker'

User.destroy_all
Stack.destroy_all
Note.destroy_all

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
  username:   'HPJAP',
  email:      'member@example.com',
  password:   'password'
  )
member.skip_confirmation!
member.save!

CuratedStacks = ["Rails Errors","Command Line","Shortcuts","Database","Online Resources","Cheat Sheets","Rails General","Git","Workflows","Tricks","Troubleshooting","Testing / Tdd","Ruby General","Gems","Other Languages","Needs Answering"].sort

CuratedStacks.each do |f|
  stack = Stack.new
  stack.title = f
  stack.description = "Modi aut animi consequuntur qui tempora aspernatur aperiam. Consequuntur minima tenetur iure quae. Voluptas optio consequatur harum. Architecto quaerat similique repellendus consequatur aut quo animi."
  stack.save
end
stacks = Stack.all

# stack_title = "Rails Errors"

# if !Stack.exists?(title: stack_title)
#   Stack.create!(
#     title: stack_title,
#     description: "All about Rails Errors"
#   )
# end

# [
#   { title: "Rails Errors", description: "All about ..."},
#   { title: "Rails Errors", description: "All about ..."}
# ]


5.times do 
  user = User.new(
    name:       Faker::Name.name,
    username:   Faker::Internet.user_name,
    email:      Faker::Internet.email,
    password:   Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save
end
users = User.all


100.times do
  note = Note.new(
    title: Faker::Lorem.sentence,
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.\n\nAt vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.\n\nSit ad mandamus dignissim laboramus, quot aeterno principes ad nam. Ad has audire saperet epicurei, eruditi quaestio omittantur eos at, eripuit intellegam ex eos. Qui utroque efficiantur in, sea placerat disputando id. Nec alii copiosae te, nibh commune aliquando duo ne, nonumy postea officiis ne cum. Pri an quidam moderatius.",
    user: users.sample
    )
  note.update_attributes(created_at: rand(10.minutes .. 1.year).ago)
  note.update_rank
  note.save(validate: false)
end
notes = Note.all

4.times do
  notes.each do |n|
    n.stacks << stacks.sample
    n.save
  end
end


# Create an admin user
admin = User.new(
  name:       'Admin User',
  email:      'admin@example.com',
  password:   'password',
  role:       'admin'
  )
admin.skip_confirmation!
admin.save!



puts "Seed finished"
puts "#{Stack.count} stacks created"
puts "#{User.count} users created"
puts "#{Note.count} notes created"
