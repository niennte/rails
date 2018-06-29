class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    # return current_user if tru, assign result of DB query otherwise
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
