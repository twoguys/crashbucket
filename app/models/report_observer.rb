class ReportObserver < ActiveRecord::Observer

  def after_create(report)
    Notifications.crash(report).deliver
  end
  
end
