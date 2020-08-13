class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(host: current_user)
    @group.save
    redirect_to groups_path
  end

  def index
    @groups = Group.all
    @show_groups = []
    @your_groups = []
    @groups.each do |group|
      @your_groups << group if (group.host_id == current_user.id)
      @show_groups << group if (group.host_id != current_user.id && group.users.include?(current_user))
    end
  end

  def show
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    Group.destroy(@group.id)
    redirect_to groups_path
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:user_id, :date, :time, :additional_info)
  end
end
