class UserSessionsController < ApplicationController
  def new
    session[:forwarding_url] = nil
    render layout: 'logged_out'
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user
      log_in user
      redirect_back_or my_time_entries_path
    else
      flash[:danger] = 'Invalid username'
      redirect_back(fallback_location: login_path)
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
