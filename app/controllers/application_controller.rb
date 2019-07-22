class ApplicationController < ActionController::Base
  protect_from_forgery without: :exception

  include SessionsHelper

  private

  def require_user_login
    unless logged_in?
      redirect_to login_path
    end
  end
end
