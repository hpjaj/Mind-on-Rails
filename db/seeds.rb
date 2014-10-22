require 'faker'

User.destroy_all
Stack.destroy_all
Note.destroy_all


# Create a member
# member = User.new(
#   name:       'Member User',
#   username:   'HPJAP',
#   email:      'member@example.com',
#   password:   'password'
#   )
# member.skip_confirmation!
# member.save!


# CuratedStacks = ["Rails Errors","Command Line","Shortcuts","Database","Online Resources","Cheat Sheets","Rails General","Git","Workflows","Tricks","Troubleshooting","Testing / Tdd","Ruby General","Gems","Other Languages","Needs Answering"].sort

# CuratedStacks.each do |f|
#   stack = Stack.new
#   stack.title = f
#   stack.headline = Faker::Lorem.sentence
#   stack.description = "Modi aut animi consequuntur qui tempora aspernatur aperiam. Consequuntur minima tenetur iure quae. Voluptas optio consequatur harum. Architecto quaerat similique repellendus consequatur aut quo animi."
#   stack.save
# end
# stacks = Stack.all


# [
#   { title: "Rails Errors", description: "All about ..."},
#   { title: "Rails Errors", description: "All about ..."}
# ]



stack_title = "Rails Errors"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "Rails error pages are FANTASTIC…when you understand them.",
    description:  "This stack is for interpreting Rails error pages.  We learn from our mistakes.  This will likely not be the last time you see this particular flavor of error.  When you get an error page, and something clicks in your mind, capture it.  Translate what the error is really telling you.  When looking at a Rails error with a mentor or senior developer, ask them to explain what they see in the error.  What are the cues, the key terms and phrases, and how do they leverage this information to resolve the issue.   ",
    id: 1
  )
end

stack_title = "Command Line"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "The command line opens the door to a whole new world.  I just hope I don’t screw up my computer.",
    description:  "This stack is for interacting with this new interface called the command line.  How do you navigate?  What are the valuable commands you are learning?  What do you want to remember about bash profiles?  What about IRB and simple prompt?  Accessing and using the consoles and editors?  What about the terminal, and iTerm2, and Vagrant?  How can you customize the experience to fit your tastes?  ",
    id: 2
  )
end

stack_title = "Shortcuts"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "Don’t. Touch. That. Mouse. Wait, what?",
    description:  "Great developers can type at the speed of thought.  As you learn the craft, you’ll want to begin practicing keyboard shortcuts for the programs that you use.  Any text editor.  Any program.  Any interface.  What keyboard shortcuts do you want to remember to help you increase your productivity?",
    id: 3
  )
end

stack_title = "Databases"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "Isn’t a database just a spreadsheet?  No?!  Oh man!",
    description:  "A database makes a website a web application…don’t take this power lightly.  How do I interact with the data?  How do I get this data to interact with that other data?  Why is it so hard to access the frickin’ data?!  Wait, what happened to all my data?  There is much to learn, to remember, and to respect about working with databases.",
    id: 4
  )
end

stack_title = "Online Resources"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "You found the needle in the haystack?!  Don’t drop it…  D’op!",
    description:  "There are 1.1 billion websites on the Internet.  As you progress through your journey of becoming a Ruby on Rails developer, you will come across some great tutorials, blogs, solutions, articles, podcasts, sources of inspiration, answers to questions, etc.  Once you’ve found these gems, you’ll want to remember them, and keep them handy.",
    id: 5
  )
end

stack_title = "Tricks"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "You deleted 15 lines of my code, added two words and an exclamation point, and now it works…Dang it!  How did you do that?!",
    description:  "Enough said.  You will encounter many of these moments when working with other developers.  You’ll hear people say things like, “Oh it’s just something I picked up along the way.”  When you see a trick, write it down.  You will want to remember them.",
    id: 6
  )
end

stack_title = "Rails General"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "This is why you’re here, ain’t it?  Then don’t forget this, that and the other thing.",
    description:  "You’ve probably been told that Ruby is a language and Rails is a framework, but truly appreciating that distinction takes time.  As you progress you will sharpen your interpretation of what makes Rails, Rails.  And as you become more aware of how you can leverage Rails to accomplish a given task, you will want to remember how to do it again in the future.  This stack is dedicated to capturing these types of Rails framework revelations.  Things that might be found in a Rails guide, if you were the author.",
    id: 7
  )
end

stack_title = "Testing / TDD"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "Don’t we have some people for that?  I’m “the people”?  Dang it!",
    description:  "Testing is where the rubber meets the road.  If your app works today, but not tomorrow, what’s the point?  We all test in our own ways, but the industry has standards and expectations for this.  And most employers have their own set of expectations around testing, which may pragmatically exceed standards.  Testing can involve learning an entire body of new languages and methods.  Testing should be learned early, and practiced often.  Testing can be tricky, and the syntax is in flux, as this area is currently like the wild west of development.  As you begin to figure out what is and is not currently working for you, you will want to document and remember it.  This stack is dedicated to anything and everything around testing.",
    id: 8
  )
end

stack_title = "Workflows"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "Workflows?  Why you gettin’ all “corporate” on me?",
    description:  "Google defines it as “the sequence of industrial, administrative, or other processes through which a piece of work passes from initiation to completion.”  Blah blah blah.  Workflows are one of those things that you slowly start to define, for yourself, over time.  They are relevant because, when developing with Ruby on Rails, you will begin to notice a number of repeatable patterns in your coding activities.  Sequences that you have learned, maybe the hard way, that if a step is missed, or done out of order, it can cause unnecessary headaches, frustration, and wasted time.  This stack is dedicated to capturing these small, medium and large collections of ‘ways you accomplish task xyz’.",
    id: 9
  )
end

stack_title = "Cheat Sheets"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "Does this thing contain all the answers?",
    description:  "No!  But a good cheat sheet can be extremely helpful at the right time.  This stack is dedicated to compiled lists of niche information, related to Ruby on Rails.   Cheat sheets that you have discovered around syntax, or testing, or rake commands, or truth tables, or whatever helps you to learn the content and to be productive.",
    id: 10
  )
end

stack_title = "Troubleshooting"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "When something breaks, can I just raise my hand?  Please?",
    description:  "Troubleshooting is a skill unto itself.  The ways to troubleshoot problems are not blatantly obvious, especially for a beginner.  And they are not taught alongside a curriculum.  Like many things, you learn them through experience.  As you work alongside other developers, you will gain exposure to the many tactics, methods, and approaches that people use to troubleshoot problems.  You will definitely want to remember these!",
    id: 11
  )
end

stack_title = "Git"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "What’s get?  Oh…GIT.  I don’t git it.  Who’s on first?",
    description:  "As you will find, Git is no joke.  Version control is paramount when professionally writing code, and Git is the go-to version control system for Ruby on Rails.  The Git basics can be grasped quickly, but should not be taken for granted. Git also offers a much deeper and broader set of functionality that is extremely powerful, and can have a steep learning curve.  This stack is dedicated to all things Git.  Git commands, concepts, processes, Github, Git tools, resources, best practices, tutorials, etc.",
    id: 12
  )
end

stack_title = "Ruby General"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "Not learning Ruby is a bit like knowing how to fly a plane…on the ground.",
    description:  "Without Ruby, there is no Rails.  Ruby is the backbone.  It would be wise to have a reasonably solid Ruby foundation before adding on Rails.  After that you will hit a certain point where you’ll realize that, in order to enact a desired feature for your web app, you’ll need to apply more advanced Ruby tactics.  This will also come into play when trying to understand other developer’s code.  As you move further down your Ruby learning path, your eyes will open wider to how much you can do with Ruby, and all the elegant and clever ways people apply Ruby to accomplish a given task.  You will want to remember these.  This stack is dedicated to capturing these moments of Ruby enlightenment.",
    id: 13
  )
end

stack_title = "Gems"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "They already solved it AND wrote it?  Well how much is that going to cost me?  It’s free!?!  Well heck yeah, sign me up!",
    description:  "There are times to use gems, and there times not to use gems.  In either case, you will want to be educated when making these decisions.  What have you learned when using a particular gem?  What are those little steps that were not spelled out, or that were unique to your app, that you needed to do in order to get the gem to work properly for you?  You will want to remember these little additions and subtractions for your next project.",
    id: 14
  )
end

stack_title = "Other Languages"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "POL-Y-GLOT. I-AM-NOT.",
    description:  "Yes you are.  You are learning Ruby, Rails, testing…you’re already multilingual.   In this profession you are always going to be trying out new ways to do things, which includes new languages.  For Ruby on Rails development, it makes sense to know some HTML, CSS, Sass, JavaScript, AJAX, JSON, SQL, HAML, and jQuery, just to name a few.  As most of these will be used as tools to compliment your web apps, you probably will not be using them as regularly as you do the core languages.  That said, you’ll want to be sure to capture and remember how you applied the language.  What, if anything, needed to be done to use the language inside a Ruby on Rails application?  What was unique about the circumstances, the code, and the solution you arrived at?  What were the helpful resources?",
    id: 15
  )
end

stack_title = "Needs Answering"
if !Stack.exists?(title: stack_title)
  Stack.create!(
    title:        stack_title,
    headline:     "Why is my list of questions longer than your…",
    description:  "The one guarantee about learning anything, especially coding, is that you will have lots of questions.  Questions are good.  Questions are proof of progress.  Likewise, unanswered questions can impede progress.  If you have a question, and cannot get it answered right now, write it down!  Now!  And when you’re with your mentor or other developers, grab your list.  Capturing all of your questions in one place makes it significantly more likely that all of your questions will get answered.",
    id: 16
  )
end



# stacks = Stack.all


# 5.times do 
#   user = User.new(
#     name:       Faker::Name.name,
#     username:   Faker::Internet.user_name,
#     email:      Faker::Internet.email,
#     password:   Faker::Lorem.characters(10)
#     )
#   user.skip_confirmation!
#   user.save
# end
# users = User.all


# 100.times do
#   note = Note.new(
#     title: Faker::Lorem.sentence,
#     body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.\n\nAt vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.\n\nSit ad mandamus dignissim laboramus, quot aeterno principes ad nam. Ad has audire saperet epicurei, eruditi quaestio omittantur eos at, eripuit intellegam ex eos. Qui utroque efficiantur in, sea placerat disputando id. Nec alii copiosae te, nibh commune aliquando duo ne, nonumy postea officiis ne cum. Pri an quidam moderatius.",
#     user: users.sample
#     )
#   note.update_attributes(created_at: rand(10.minutes .. 1.year).ago)
#   note.update_rank
#   note.create_vote
#   note.save(validate: false)
# end
# notes = Note.all

# 2.times do
#   notes.each do |n|
#     n.stacks << stacks.sample
#     n.save
#   end
# end


# # Create an admin user
# admin = User.new(
#   name:       'Admin User',
#   username:   'Admin',
#   email:      'admin@example.com',
#   password:   'password',
#   role:       'admin'
#   )
# admin.skip_confirmation!
# admin.save!



# puts "Seed finished"
# puts "#{Stack.count} stacks created"
# puts "#{User.count} users created"
# puts "#{Note.count} notes created"
