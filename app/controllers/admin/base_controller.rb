class Admin::BaseController < ApplicationController
  before_filter :admin_required
  before_filter {|c| @admin = true }
  
  def index
  end
end