source 'https://rubygems.org'
ruby '2.6.6'
gem 'haml'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.10'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.7.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
#use Devise for authentication and hashing sensitive information
gem 'devise'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem "open-uri"
gem "json"

gem 'dotenv-rails'

gem "omniauth-rails_csrf_protection"

gem 'omniauth-google-oauth2'

gem 'omniauth-facebook'

gem 'omniauth-github'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec','~>3.5'
  gem 'rspec-rails'
  gem'guard-rspec'
  gem 'rspec-core'
  # Use sqlite3 as the database for Active Record
  gem 'rubocop'
  gem 'sqlite3', '~> 1.3.6'
  gem 'spring'
  gem 'cucumber-rails', :require=>false
  gem 'factory_bot'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring

end

group :test do
  gem 'rspec-expectations'
  # gem 'cucumber-rails', :require=>false
  gem 'database_cleaner'
  gem 'simplecov', require: false
end

group :production do
  gem 'pg','~>0.20' # for Heroku deployment
  gem 'rails_12factor'
end
