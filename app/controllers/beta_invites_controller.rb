class BetaInvitesController < ApplicationController
  
  def new
    @beta_invite = BetaInvite.new
  end
  
  def create
    @beta_invite = BetaInvite.new(params[:beta_invite])
    
    if @beta_invite.save
      redirect_to root_path, :notice => "We'll let you know!"
    else
      redirect_to root_path, :alert => "Check yo self!"
    end
  end
  
end