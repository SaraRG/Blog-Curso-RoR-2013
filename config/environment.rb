# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Blog::Application.initialize!

require 'pdf/writer'
Mime::Type.register 'application/pdf', :pdf