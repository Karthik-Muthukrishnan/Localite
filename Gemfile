source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
#gem 'zurb-foundation', '4.3.2'
#upgrade to foundation 5
gem 'foundation-rails'
gem 'compass-rails','1.0.3'
gem 'bcrypt-ruby', '3.0.1'
gem 'will_paginate', '3.0.4'
gem 'pageless-rails', github: 'rorlab/pageless-rails'


# MySQL for development and test environments
group :development, :test do
  gem 'mysql2'
  # test suite
  gem 'rspec-rails', '2.13.1'
  # Guard - For automated testing
  gem 'guard-rspec', '2.5.0'
  # Spork - To optimize automated testing 
  # by forking the server processes to avoid restart of server everytime
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
  gem 'faker', '1.1.2'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.1.1'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails', '3.0.4'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '1.1.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  #gem 'pg', '0.15.1'
  #gem 'rails_12factor', '0.0.2'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
