class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    redirect_to new_session_url
  end

  def logged_in?
    !!current_user
  end

  def ensure_session_token
    unless session[:session_token]
      flash[:errors] = "You must log in to access this feature"
      redirect_to new_session_url
    end
  end
end
