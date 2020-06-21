class UserSessionsController < ApplicationController
  before_action :downcase_email, only: %i[create]

  def new
    session[:forwarding_url] = nil
    render layout: 'logged_out'
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
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

  private

  def session_params
    params.require(:session).permit(:email)
  end

  def downcase_email
    params[:session][:email].downcase
  end
end
