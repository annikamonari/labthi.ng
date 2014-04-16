# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
StartIt::Application.initialize!

config.action_mailer.default_url_options = { :host => 'labthi.ng.heroku.com' }
