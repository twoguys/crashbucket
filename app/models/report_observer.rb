class ReportObserver < ActiveRecord::Observer

  def after_create(report)
    report.deliver_email
  end
  
end
