class PagesController < ApplicationController
  
  def about
    if current_user
      redirect_to apps_path
    else
      @user = User.new
      render :layout => "about"
    end
  end
  
  def terms
    @title = "terms"
  end
  
end
