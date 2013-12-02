source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

ruby '2.0.0'

# Use sqlite3 as the database for Active Record
gem 'pg'

gem 'mini_magick'
# Suggested for heroku, enables logging
gem 'rails_12factor', group: :production

# Use SCSS for stylesheets
  gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Railsadmin for creating control panels, easy viewing
gem 'fastercsv' # Only required on Ruby 1.8 and below

gem 'activeadmin', github: 'gregbell/active_admin'

gem 'merit'

# user authentication
gem 'devise' #, '3.0.0.rc'

gem 'best_in_place', github: 'bernat/best_in_place'

#bootstrap
#gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :github => 'anjlab/bootstrap-rails'

gem 'jquery-turbolinks'

# Generate migrations for associations, uses foreigner gem :)
gem 'immigrant'
# Used for testing associations
gem "foreigner-matcher", "~> 0.2.0", :require => nil

# server for fast development
gem 'thin'

# tagging functionality
gem 'acts-as-taggable-on'

# file upload management
gem 'carrierwave'

# Activity Stream
gem 'public_activity', github: 'pokonski/public_activity'

# Used to support Amazon S3
gem "fog"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do
  gem 'cucumber-rails', require: false
  gem "capybara-webkit"
  #gem "selenium-webdriver"
  gem "database_cleaner", ">= 0.8.0"
  gem 'simplecov', require: false
end

group :development do
  gem 'guard-livereload'
  gem 'bullet'
end

group :test, :development do
  # gem 'capybara' This gem comes with Cucumber
  gem "factory_girl_rails", "~> 4.0"
  gem 'rspec-rails'
  gem 'guard'
  gem 'faker'
  gem 'spork'
  gem 'launchy'
  gem 'guard-rspec'
  #gem 'warden', '>= 1.2.2'
  #
  require 'rbconfig'
  gem 'wdm', '>= 0.1.0' if RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
end

# Use ActiveModel has_secure_password
  gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
