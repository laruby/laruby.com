class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save_without_session_maintenance
      @user.deliver_activation_instructions
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to root_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  def activate
    @user = User.find_using_perishable_token(params[:token], 1.week)
    flash[:notice] = "Token invalid, please use the form below to resend" and redirect_to account_resend_activation_url and return if @user.nil?
    flash[:notice] = "You account is already active" and redirect_to login_url and return if @user.active?
    @user.activate!
    flash[:notice] = "Account activated" and redirect_to account_url
  end
  
  def resend_activation
    @resent = false
    if request.post?
      @user = User.find_by_email(params[:resend_activation][:email])
      @user.deliver_activation_instructions unless @user.nil?
      @resent = true
    end
  end
  
  def link_meetup_account
    if !params[:meetup_link][:link].empty?
      RAILS_DEFAULT_LOGGER.info("Looking at link")
      if params[:meetup_link][:link].match(/http:\/\/www.meetup.com\/members\/(\d+)\/?/)
        current_user.meetup_id = $1
        current_user.save
      end
    elsif !params[:meetup_link][:user_id].empty?
      RAILS_DEFAULT_LOGGER.info("Looking at user id")
      current_user.meetup_id = current_user.validate_meetup(params[:meetup_link][:user_id], params[:meetup_link][:password])
      current_user.save
    end
    redirect_to account_url
  end
end
