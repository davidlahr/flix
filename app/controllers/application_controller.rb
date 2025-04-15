class ApplicationController < ActionController::Base

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    current_user.id == user.id
  end 

  helper_method :current_user?

  def is_admin?
    current_user && current_user.admin == true
  end
  
  helper_method :is_admin?

  ### below used as callbacks in movies and user controllers

  def require_signin
    unless current_user
      redirect_to new_session_url, alert: "Please Sign in First!"
    end
  end

  def require_admin
    unless is_admin?
      redirect_to movies_path, alert: "Admin Rights Required"
    end
  end


end
