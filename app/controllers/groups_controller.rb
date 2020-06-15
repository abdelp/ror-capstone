class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  layout 'logged_out', :only => [ :show, :new, :edit ]

  def index
    @groups = Group.all
    render layout: 'application'
  end

  def show; end

  def new
    @group = current_user.groups.build
  end

  def edit; end

  def create
    @group = current_user.groups.build(group_params)

    unless group_params[:icon].nil?
      uploaded_file = Cloudinary::Uploader.upload(group_params[:icon])
      @group.icon = uploaded_file['secure_url']
    end

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, flash: { success: 'Group was successfully created.' } }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, flash: { success: 'Group was successfully updated.' } }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, flash: { success: 'Group was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
