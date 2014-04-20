class PasswordsController < ApplicationController

  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  before_filter :require_no_user

  #----------------------------------------------------------------------------
  def new
    render
  end

  #----------------------------------------------------------------------------
  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:info] = "Instructions to reset your password have been emailed to you. please check your email."
      redirect_to root_url
    else
      flash[:warning] = "No user was found with that email address."
      render :new
    end
  end

  #----------------------------------------------------------------------------
  def edit
    render
  end

  #----------------------------------------------------------------------------
  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:info] = "Password was successfully updated."
      redirect_to profile_url
    else
      render :edit
    end
  end

  #----------------------------------------------------------------------------
  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:warning] = <<-EOS
        We are sorry, but we could not locate your user profile. If you are having 
        issues try copying and pasting the URL from your email into your browser
        or restarting the reset password process.
      EOS
      redirect_to root_url
    end
  end
end
