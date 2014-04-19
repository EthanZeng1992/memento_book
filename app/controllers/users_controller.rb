class UsersController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:edit, :show, :update]

  #-----------------------------------------------------------------------------------------------------
  def new
    @user = User.new
  end

  #-----------------------------------------------------------------------------------------------------
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Successful registration."
      redirect_to profile_path 
    else
      render :new
    end
  end

  #-----------------------------------------------------------------------------------------------------
  def show 
    @user = current_user 
  end

  #-----------------------------------------------------------------------------------------------------
  def edit 
    @user = current_user 
  end

  #-----------------------------------------------------------------------------------------------------
  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Your user profile has been updated."
      redirect_to profile_path 
    else
      render :edit
    end
  end

  private
  #---------------------------------------------------------------------------------------------------  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
