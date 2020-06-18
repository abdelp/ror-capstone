class ApplicationController < ActionController::Base
  include UserSessionsHelper

  private

  def logged_in_user
    store_location unless logged_in?
    flash[:danger] = 'Please log in.' unless logged_in?
    redirect_to login_url unless logged_in?
  end
end
