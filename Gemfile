source 'http://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

#Salesforce?
gem "databasedotcom"
gem "databasedotcom-rails"

gem "newrelic_rpm"

gem "mail", ">=2.1.3"

gem 'gmaps4rails'

gem 'bcrypt-ruby', :require => 'bcrypt'

gem "paperclip", "~> 2.7"

gem "flickraw"

gem "convio-open", :git => 'git@github.com:consumersunion/convio-open.git'

#Gem to connect to Amazon S3
gem "aws-s3"
gem 'aws-sdk', '~> 1.3.4'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'


group :development, :test do
  gem 'sqlite3'
end
group :production do
  # gems specifically for Heroku go here
  gem 'pg'
end
