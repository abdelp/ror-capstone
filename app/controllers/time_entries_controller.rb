class TimeEntriesController < ApplicationController
  before_action :set_time_entry, only: %i[show edit update destroy]
  before_action :set_time_entries, only: [:index]
  before_action :set_group_options, only: %i[new edit]
  layout 'logged_out', only: %i[new edit]

  before_action :authenticate_user!

  def index
    @current_user = current_user
  end

  def show; end

  def new
    @time_entry = current_user.time_entries.build
  end

  def edit; end

  def create
    @time_entry = current_user.time_entries.build(time_entry_params)

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to @time_entry, flash: { success: 'Time entry was successfully created.' } }
        format.json { render :show, status: :created, location: @time_entry }
      else
        @group_options = Group.all.map { |u| [u.name, u.id] }
        format.html { render :new }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @time_entry.update(time_entry_params)
        format.html { redirect_to @time_entry, flash: { success: 'Time entry was successfully updated.' } }
        format.json { render :show, status: :ok, location: @time_entry }
      else
        format.html { render :edit }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @time_entry.destroy
    respond_to do |format|
      format.html { redirect_to time_entries_url, flash: { success: 'Time entry was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private

  def set_time_entry
    @time_entry = TimeEntry.find(params[:id])
  end

  def time_entry_params
    params.require(:time_entry).permit(:name, :start_time, :end_time, :amount, :group_id)
  end

  def set_time_entries
    @time_entries = TimeEntry.all.where('group_id IS NULL').includes(:group, :author)
    @group = Group.find(params[:group_id]) unless params[:group_id].nil?
    @time_entries = @group.time_entries unless @group.nil?
  end

  def set_group_options
    @group_options = Group.all.map { |u| [u.name, u.id] }
  end
end
