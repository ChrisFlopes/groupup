class Meetups::SetupController < ApplicationController
  include Wicked::Wizard

  layout "wizard"

  before_action :set_meetup

  steps(*Meetup::STEPS)

  def show
    render_wizard
  end

  def update
    case step
    when :add_meetup_time
      @meetup.add_meetup_time = true
    when :review
      @meetup.active = true
    end

    @meetup.update_attributes(meetup_params)
    @meetup.save
    render_wizard @meetup
  end

  private

  def meetup_params
    params.require(:meetup).permit(:date, :time, :additional_info)
  end

  def set_meetup
    @meetup = Meetup.find(params[:meetup_id])
  end
end
