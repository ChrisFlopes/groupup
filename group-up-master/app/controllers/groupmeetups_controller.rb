class GroupmeetupsController < ApplicationController
  before_action :set_groupmeetup, only: [:show, :edit, :update, :destroy]

  def new
    @groupmeetup = Groupmeetup.new
  end

  def create
    @groupmeetup = Groupmeetup.new(host: current_user, group: @group)
    @groupmeetup.save
    redirect_to groupmeetup_create_path(Wicked::FIRST_STEP, groupmeetup_id: @groupmeetup.id)
  end

  def index
    @groupmeetups = Groupmeetup.all

    @show_groupmeetups = []
    @groupmeetups.each do |groupmeetup|
      @show_groupmeetups << groupmeetup if (groupmeetup.host_id == current_user.id || groupmeetup.group.users.include?(current_user))
    end
  end

  def show
  end

  def edit
  end

  def update
    if @groupmeetup.update(groupmeetup_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    Groupmeetup.destroy(@groupmeetup.id)
    redirect_to root_path
  end

  private

  def set_groupmeetup
    @groupmeetup = Groupmeetup.find(params[:id])
  end

  def groupmeetup_params
    params.require(:groupmeetup).permit(:user_id, :group_id, :date, :time, :additional_info)
  end
end
