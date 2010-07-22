class Api::ReportsController < Api::BaseController
  
  before_filter :find_app
  
  def create
    @report = Report.new(params[:report])
    @app.reports << @report
    head :ok
  end
  
  
  private
  
  def find_app
    @app = App.find_by_api_key(params[:app_id])
  end
  
end