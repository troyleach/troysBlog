source 'http://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.6'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password (have to put the require in or it will brake)
# gem 'bcrypt', '~> 3.1.7'
gem "bcrypt", :require => "bcrypt"

gem 'will_paginate', '~> 3.1.0'

# Editor that is super cool
gem "wysiwyg-rails"

gem "font-awesome-rails"
# gem 'font-awesome-sass', '~> 4.7.0'

# To upload files
gem "paperclip", "~> 5.0.0"

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Add this for webkit stuff in css
gem "autoprefixer-rails"

# send email right from a form, this is just for now, i wll switch to mail gun or send grid
gem 'mail_form'

gem 'jquery-turbolinks'

#Cool gem, displays the schema in the model files and specs -basically shows the model attributes
gem 'annotate'

# this is for ruby forms, however I think I will use Angularjs instead (this was braking shit so I commented it out for now)
# gem 'simple_form'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # rspec as of 3-3-2017
  gem 'byebug'
  gem 'pry'
  gem "rspec-rails", "~> 3.5"
  gem "factory_girl_rails", "~> 4.8.0"
end

# Added this below and the last two gems above for testing
group :test do
  gem "faker", "~> 1.7.3"
  gem "capybara", "~> 2.12.1"
  gem "database_cleaner"
  gem "launchy"
  gem "selenium-webdriver"
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

