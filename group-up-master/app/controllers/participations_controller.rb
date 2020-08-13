class ParticipationsController < ApplicationController
  def new
    @participation = Participation.new
    @the_meetup = Meetup.find(params["meetup_id"])
    @participation.meetup = @the_meetup
    @participation.user = current_user
    @participation.save

    @the_meetup.save
    redirect_to root_path
  end

  def create
    @participation = Participation.new(participation_params)
    if @participation.save
      redirect_to root_path
    else
      render :new
    end
  end
end
