class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :store_current_location, :unless => :devise_controller?

  def store_current_location
    store_location_for(:user, request.url)
  end

  private
  # override the devise method for where to go after signing out because theirs
  # always goes to the root path. Because devise uses a session variable and
  # the session is destroyed on log out, we need to use request.referrer
  # root_path is there as a backup
  def after_sign_in_path_for(resource)
    session["user_return_to"] || root_path
  end

  def after_sign_in_path_for(resource)
    session["user_return_to"] || root_path
  end

end
