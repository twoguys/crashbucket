class AppsController < ApplicationController
  
  before_filter :login_required
  
  def index
    @apps = current_user.apps
  end
  
  def show
    @app = current_user.apps.find(params[:id])
  end
  
  def new
    @app = current_user.apps.new
  end
  
  def edit
    @app = current_user.apps.find(params[:id])
  end
  
  def create
    @app = current_user.apps.new(params[:app])
    
    if @app.save
      redirect_to apps_url, :notice => "App created successfully"
    else
      flash[:alert] = "There was an error creating a new app"
      render :action => 'new'
    end  
  end
  
  def update
    @app = current_user.apps.find(params[:id])
    
    if @app.update_attributes(params[:app])
      redirect_to @app, :notice => "App updated successfully"
    else
      flash[:alert] = "There was an error creating a new app"
      render :action => 'edit'
    end
        
  end
  
  
  
  
end