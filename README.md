#Mind on Rails

Mind on Rails is a knowledge exchange, note-taking tool, specifically for Ruby on Rails learners. It is a way to capture what you learn through your journey with Ruby on Rails.



Gems used:
```ruby
gem 'rails', '4.1.1'
gem 'pg'

group :production do
  gem 'rails_12factor'
end

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development

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

![Image of a Mind on Rails note](http://hpjaj.com/web-images/mind-on-rails/note)

