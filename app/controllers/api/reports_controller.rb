class Api::ReportsController < Api::BaseController
  
  before_filter :find_app
  
  def create
    @report = Report.new(params[:report])
    @report.generate_fingerprint
    @report.app = @app
    
    existing_report = @app.reports.find_by_fingerprint(@report.fingerprint)
    
    if existing_report
      existing_report.increment!(:count)
      head :ok
    else
      if @report.save
        head :ok
      else
        render :json => { :errors => @report.errors }, :status => :not_acceptable # 406
      end
    end

  end
  
  
  private
  
  def find_app
    @app = App.find_by_api_key(params[:app_id])
    head :forbidden and return unless @app # 403
  end
  
end