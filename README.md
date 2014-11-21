#Mind on Rails

[Mind on Rails](https://mind-on-rails.herokuapp.com/) is a knowledge exchange, note-taking tool, specifically for Ruby on Rails learners. It is a way to capture what you learn through your journey with Ruby on Rails.


Here is the interface for creating a new note in Mind on Rails:

![Interface for creatin a note](http://hpjaj.com/web-images/mind-on-rails/creating-a-note.jpg)

Here is a note that's been created in Mind on Rails:

![Note from Mind on Rails](http://hpjaj.com/web-images/mind-on-rails/mor-note-2.jpg)

Here is the My Notes view in Mind on Rails:

![My Notes view Mind on Rails](http://hpjaj.com/web-images/mind-on-rails/my-notes.jpg)

Here is the list of *stacks* in Mind on Rails:

![List of Stacks in Mind on Rails](http://hpjaj.com/web-images/mind-on-rails/stacks-mor.jpg)

Here is the *trending* notes view in Mind on Rails:

![Trending notes view in Mind on Rails](http://hpjaj.com/web-images/mind-on-rails/trending-mor.jpg)

Additional Gems used in Mind on Rails:
```ruby
gem 'pg'

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'capybara', '~> 2.3.0'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'shoulda-matchers', require: false
  gem 'poltergeist'
  gem 'email_spec'
end

gem 'bootstrap-sass', '~> 3.2.0'
gem 'devise'
gem 'figaro'
gem 'faker'
gem 'newrelic_rpm'
gem 'simple_form'
gem 'redcarpet'
gem 'will_paginate', '~> 3.0.5'
gem 'pygments.rb'
gem 'pg_search'
```


