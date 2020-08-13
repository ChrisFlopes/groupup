class MembersController < ApplicationController
  def new
    @member = Member.new
    @the_group = Group.find(params["group_id"])
    @member.group = @the_group
    @member.user = current_user
    @member.save

    @the_group.save
    redirect_to root_path
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to root_path
    else
      render :new
    end
  end
end
