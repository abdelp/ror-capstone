class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :logged_in_user, only: %i[index edit update destroy
                                          following followers]
  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new

    render layout: 'logged_out'
  end

  def edit; end

  def create
    @user = User.new(user_params)

    unless user_params[:gravatar_url].nil?
      uploaded_file = Cloudinary::Uploader.upload(user_params[:gravatar_url])
      @user.gravatar_url = uploaded_file['secure_url']
    end

    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to my_time_entries_path }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, layout: 'layouts/logged_out' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_time_entries
    @time_entries = current_user.time_entries.includes(:group)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :gravatar_url)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
