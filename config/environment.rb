# Load the rails application
ENV['SSL_CERT_FILE'] = "C:\RailsInstaller\cacert.pem"
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mohhaiti::Application.initialize!

require 'flickraw'

