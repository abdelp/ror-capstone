class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  def index
    @users = User.all
  end

  def show
  end

  def new
    session[:forwarding_url] = login_path
    @user = User.new

    render layout: "logged_out"
  end

  def edit
  end

  def create
    @user = User.new(full_name: user_params[:full_name], name: user_params[:name].downcase,
                     email: user_params[:email], password: [:password])

    unless user_params[:gravatar_url].nil?
      uploaded_file = Cloudinary::Uploader.upload(user_params[:gravatar_url])
      @user.gravatar_url = uploaded_file['secure_url']
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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
    @my_time_entries = current_user.time_entries.where("group_id IS NOT NULL")
  end

  private

    def user_params
      params.require(:user).permit(:full_name, :name, :email, :password, :gravatar_url)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
