class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil if !session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    if current_user
      return true
    else
      false
    end
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end



end
