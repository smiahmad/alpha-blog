class ApplicationController < ActionController::Base

  # following will make the current_user method availabel in the views as well
  helper_method :current_user, :logged_in?

  def current_user
    # following syntax (with ||) will retyrn current_user if it is already there
    # and not hit the database each time the current_user method is called
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # following syntax with !! converts to boolean, meaning if @current_user has
    # a value below will return true
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform this action"
      redirect_to login_path, status: :see_other
    end
  end
  
end
