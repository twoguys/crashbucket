class Notifications < ActionMailer::Base
  default :from => "noreply@#{ENV['DOMAIN']}"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.actionmailer.notifications.beta_invite.subject
  #
  def beta_invite(invite)
    @invite     = invite
    @invite_url = invite_code_url(@invite.code)
    
    mail(:to => invite.email, :subject => "[CrashBucket] Beta Invite")
  end
  
  def crash(report)
    @report       = report
    @report_url   = app_report_url(report.app, report) 
    
    mail(:to => report.app.user.email, :subject => "[#{report.app.name}] #{report.exc_name}")
  end
  
end
