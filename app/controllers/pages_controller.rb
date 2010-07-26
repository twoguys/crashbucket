class PagesController < ApplicationController
  
  def about
    redirect_to apps_path and return if current_user
    @user = User.new
    render :layout => "about"
  end
  
  def terms
    @title = "terms"
  end
  
end
