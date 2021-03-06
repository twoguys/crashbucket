class UserSessionsController < ApplicationController

  def new
    redirect_to apps_path if current_user
    @user_session = UserSession.new
    @title = "login"
  end

  # FIXME
  def create  
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      if session[:redirect_to]
        redirect_to session[:redirect_to], :notice => "Welcome back!"
      else
        redirect_to apps_path, :notice => "Welcome back!"
      end
    else
      flash[:alert] = "Invalid login, please check your username and password"
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "You have been successfully signed out"  
    redirect_to login_path
  end
  
  

end
