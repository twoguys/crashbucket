class AppsController < ApplicationController
  
  before_filter :login_required
  
  def index
    @title = "apps"
    @apps = current_user.apps.paginate(:page => params[:page])
    #redirect_to new_app_path if @apps.empty?
  end
  
  def show
    @app = current_user.apps.find(params[:id])
    @title = @app.name.downcase
    @reports = @app.reports.open
    @open = true
  end
  
  def info
    @app = current_user.apps.find(params[:id])
    @info = true
  end

  def closed
    @app = current_user.apps.find(params[:id])
    @reports = @app.reports.closed
    @closed = true
    render 'show'
  end
  
  def new
    @app = current_user.apps.new
  end
  
  def edit
    @app = current_user.apps.find(params[:id])
  end
  
  def create
    @app = current_user.apps.new(params[:app])
    
    if current_user.apps.size > 3
      flash[:alert] = "Sorry, the app limit us currently 4 during beta testing"
      render :action => 'new'
    elsif @app.save
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