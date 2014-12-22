source 'http://rubygems.org'

gem 'rails', '3.2.11'

gem 'rack-timeout'


# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

#Salesforce?
gem "databasedotcom"
gem "databasedotcom-rails"

gem "newrelic_rpm"

gem "nokogiri", "1.6.3.1"

gem "mail", ">=2.1.3"
gem "httparty", "0.9.0"

gem "thin"

gem 'gmaps4rails', "1.5.6"

gem 'bcrypt-ruby', :require => 'bcrypt'

gem "paperclip", "~> 2.7"

gem "flickraw"

gem "convio-open", :git => 'git://github.com/jesseb312/convio-open.git'

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

gem 'exception_notification', '4.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'


group :development, :test do
  #gem 'sqlite3'
  gem 'pg'
end
group :production do
  # gems specifically for Heroku go here
  gem 'pg'
  gem ruby '2.1.2p95'
end
