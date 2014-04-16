class UserSessionsController < ApplicationController

  #-----------------------------------------------------------------------------------------------------
  def new
    @user_session = UserSession.new
  end

  #-----------------------------------------------------------------------------------------------------
  def create
    @user_session = UserSession.new(user_session_params)

    if @user_session.save
      flash[:notice] = "Successful login."
      redirect_to profile_path
    else
      render :new
    end
  end

  #-----------------------------------------------------------------------------------------------------
  def destroy
    current_user_session.destroy
    flash[:notice] = "You are logout."
    redirect_to login_path 
  end

  private
  #---------------------------------------------------------------------------------------------------  
  def user_session_params
    params.require(:user_session).permit(:username, :password)
  end

end
