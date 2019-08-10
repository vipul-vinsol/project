class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  private 
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      current_user != nil
    end

    def authenticate
      redirect_to(root_path) unless logged_in?
    end

    def authenticate_admin
      redirect_back(fallback_location: root_path) unless logged_in? && current_user.role == "admin"
    end
end
