# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!



ActionMailer::Base.smtp_settings = {
  # :user_name => ENV['SENDGRID_USERNAME'],
  :user_name => 'app180720572@heroku.com',
  # :password => ENV['SENDGRID_PASSWORD'],
  :password => 'di5i8ea68493',
  :domain => 'heroku.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}