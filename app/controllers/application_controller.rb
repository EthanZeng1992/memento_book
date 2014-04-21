class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user_session, :current_user

  private
  #-----------------------------------------------------------------------------
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  #-----------------------------------------------------------------------------
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  #-----------------------------------------------------------------------------
  def require_no_user
    if current_user
      store_location
      flash_notice
      redirect_to profile_path
    end
  end

  #-----------------------------------------------------------------------------
  def require_user
    unless current_user 
      store_location
      flash[:warning] = "You must login !" 
      redirect_to login_path
    end
  end

  #-----------------------------------------------------------------------------
  def flash_notice
      flash[:warning] = "You must logout!" if params[:controller] == "users" 
      flash[:info] = "You have already logined!" if params[:controller] == "user_sessions"
  end

  #-----------------------------------------------------------------------------
  def store_location
    session[:return_to] = request.url
  end

  #-----------------------------------------------------------------------------
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default) 
    session[:return_to] = nil
  end

end
