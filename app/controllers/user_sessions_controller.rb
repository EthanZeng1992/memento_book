class UserSessionsController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:destroy]
  #-----------------------------------------------------------------------------------------------------
  def new
    @user_session = UserSession.new
  end

  #-----------------------------------------------------------------------------------------------------
  def create
    @user_session = UserSession.new(user_session_params)

    if @user_session.save
      flash[:info] = "Login successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  #-----------------------------------------------------------------------------------------------------
  def destroy
    current_user_session.destroy
    flash[:info] = "You are logout."
    redirect_to login_path 
  end

  private
  #---------------------------------------------------------------------------------------------------  
  def user_session_params
    params.require(:user_session).permit(:username, :password)
  end

end
