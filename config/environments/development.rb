Mohhaiti::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
  
  # Path to my ImageMagick
  Paperclip.options[:command_path] = "/c/ImageMagick-6.5.6-Q8/"
  
  #Databasedotcom options
  #DATABASEDOTCOM_CLIENT_ID="3MVG9QDx8IX8nP5SfDXgDDfBwGBG1ExFGGeZcZi7fdhrj47p6jtKr38QDPSe6R0MFwBLUoqUVJZujDIj4H0sm"
  #DATABASEDOTCOM_CLIENT_SECRET="6124701994660720688"
  #Now set in config/databasedotcom.yml
  
end
