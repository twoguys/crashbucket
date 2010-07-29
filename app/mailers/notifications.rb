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
  
end
