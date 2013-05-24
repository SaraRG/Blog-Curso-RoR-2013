class ApplicationController < ActionController::Base
  add_breadcrumb "Home", :root_path
  protect_from_forgery
end
