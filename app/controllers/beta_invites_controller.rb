class BetaInvitesController < ApplicationController
  
  def new
    @beta_invite = BetaInvite.new
  end
  
  def create
        
    if BetaInvite.find_by_email(params[:beta_invite][:email])
      redirect_to new_beta_invite_path, :alert => "We already have your email, yo!"
    else
    
      @beta_invite = BetaInvite.new(params[:beta_invite])
    
      if @beta_invite.save
        redirect_to new_beta_invite_path, :notice => "We'll let you know!"
      else
        redirect_to new_beta_invite_path, :alert => "Check yo self! You forgot your email..."
      end
      
    end
  end
  
end