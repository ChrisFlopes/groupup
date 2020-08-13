class MeetupsController < ApplicationController
  before_action :set_meetup, only: [:show, :edit, :update, :destroy]

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(host: current_user)
    @meetup.save
    redirect_to meetup_create_path(Wicked::FIRST_STEP, meetup_id: @meetup.id)
  end

  def index
    @meetups = Meetup.all

    @show_meetups = []
    @meetups.each do |meetup|
      @show_meetups << meetup if (meetup.host_id == current_user.id || meetup.users.include?(current_user))
    end
  end

  def show
  end

  def edit
  end

  def update
    if @meetup.update(meetup_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    Meetup.destroy(@meetup.id)
    redirect_to root_path
  end

  private

  def set_meetup
    @meetup = Meetup.find(params[:id])
  end

  def meetup_params
    params.require(:meetup).permit(:user_id, :date, :time, :additional_info)
  end
end
