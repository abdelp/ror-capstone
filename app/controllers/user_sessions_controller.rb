class UserSessionsController < ApplicationController
  def new
    render layout: "logged_out"
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user
      log_in user
      redirect_back_or my_time_entries_path
    else
      flash.now[:danger] = 'Invalid username'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
