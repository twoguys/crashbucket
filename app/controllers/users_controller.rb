class UsersController < ApplicationController

  before_filter :login_required, :only => [:update, :edit]

  def new
    redirect_to root_path if current_user
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_path, :notice => "Thank you for signing up"
    else
      render :action => 'new'
    end
  end
  
  
  # def create
  #   @user = User.new(params[:user])
  # 
  #   respond_to do |format|
  #     format.html do
  #       if verify_recaptcha(:model => @user, :message => "Oh! It's error with reCAPTCHA!") && @user.save
  #         @user.save
  #         #redirect_to group_path, :notice => "Thank you for signing up"
  #         current_user.deliver_activation_email!
  #         current_user_session.destroy
  #       else
  #         render :action => 'new'
  #       end
  #     end
  #     
  #     format.json do
  #       if params[:key] == ENV['NEW_USER_KEY']
  #         @user.save
  #         render :json => @user.to_json
  #       else
  #         render :json => { :error => "Invalid New User Key" }.to_json, :status => :unprocessable_entity
  #       end
  #     end
  #   end
  # end
  
  def edit
  end

  def update
    current_user.update_attributes(params[:user])
    if current_user.save
      flash[:notice] = "We've saved your information."
    else
      flash[:error] = "There were errors with your information."
    end
    redirect_to edit_user_path(current_user)
  end
  
  
  # def activate
  #   @user = User.find_using_perishable_token(params[:id])  
  #   if @user
  #     @user.activate!
  #     flash[:notice] = "Your account has been activated, please sign in"
  #   else
  #     flash[:alert] = "We're sorry, but that activation link is invalid"
  #   end
  #   redirect_to signin_path
  # end
  

end
