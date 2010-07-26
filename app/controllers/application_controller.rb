class ApplicationController < ActionController::Base
  include Authentication

  protect_from_forgery
  layout 'application'
  
  before_filter :find_apps
  
  def find_apps
    @apps = current_user.apps if current_user
  end
  
end
