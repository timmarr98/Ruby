class ApplicationController < ActionController::Base
  add_flash_types(:danger)

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def current_user?(user)
    current_user == user
  end

  private
  def require_signin
    unless current_user
      session[:intended_url] = request.url #store the request URL so we can route user after signing in
      redirect_to new_session_url, alert: "Please sign in first!"
    end
  end

  helper_method :current_user, :current_user? #Make it accessible to the view pages

end
