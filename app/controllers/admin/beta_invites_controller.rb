class Admin::BetaInvitesController < Admin::BaseController
  
  def index
    @beta_invites = BetaInvite.all
  end
  
  def deliver
    @beta_invite = BetaInvite.find(params[:id])
    @beta_invite.deliver
    redirect_to admin_beta_invites_path
  end
  
end