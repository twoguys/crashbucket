class Admin::BaseController < ApplicationController
  before_filter :admin_required
  before_filter :apps_hack
  
  def apps_hack
    @apps = []
  end
end