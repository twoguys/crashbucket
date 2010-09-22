class Admin::AppsController < Admin::BaseController
  
  def index
    @apps = App.all
  end
  
end