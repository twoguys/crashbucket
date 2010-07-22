class ReportsController < ApplicationController
  
  before_filter :find_app
  
  def index
    @reports = @app.reports.paginate(:page => params[:page])
  end
  
  def show
    @report = @app.reports.find(params[:id])
  end
  

  
  private
  
  def find_app
    @app = App.find(params[:app_id])
  end
  
end