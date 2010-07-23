class Api::ReportsController < Api::BaseController
  
  before_filter :find_app
  
  def create
    @report = Report.new(params[:report])
    @report.generate_fingerprint
    
    #existing_report = @app.reports.find_by_fingerprint(@report.fingerprint)
    existing_report = @app.reports.where(:fingerprint => @report.fingerprint)
    
    if @app.bundle_identifer != @report.bundle_identifer
      head :conflict
    elsif existing_report
      existing_report.increment!(:count)
      head :ok
    else
      if @app.reports << @report
        head :ok
      else
        render :json => { :errors => @report.errors }, :status => :not_acceptable # 406
      end
    end
  end
  
  
  private
  
  def find_app
    @app = App.where(:api_key => params[:app_id])
    return head :not_found unless @app
  end
  
end