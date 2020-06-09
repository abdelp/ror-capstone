class UserSessionsController < ApplicationController
  before_action :user_authenticated, only: [:new]
  def new; end

  def create
    if find_user
      session[:name] = params[:name]
      session[:id] = @current_user.id

      redirect_to(root_path, notice: 'Logged in successfully.')
    else
      flash.now.alert = 'Login failed.'
      render action: :new
    end
  end

  def destroy
    reset_session
    redirect_to(:login, notice: 'Logged out!')
  end

  private

  def find_user
    @current_user = User.find_by(name: params[:name])
  end

  def user_authenticated
    redirect_to events_path if session[:name]
  end
end
