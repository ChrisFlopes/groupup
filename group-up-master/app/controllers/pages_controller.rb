class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing]

  layout "landing", only: :landing

  def home
    if current_user
      @my_meetups = Meetup.where(active: true).order(date: :asc).order(time: :asc)
      @meetups = []
      @my_meetups.each do |meetup|
        @meetups << meetup if (meetup.host_id == current_user.id || meetup.users.include?(current_user))
      end

      @all_joins = Meetup.where(status: "pending", active: true).order(date: :asc).order(time: :asc) #, host: :current_user) #  && user_id: current_user.id
      @joins = []
      @all_joins.each do |meetup|
        @joins << meetup if (meetup.host_id != current_user.id && !meetup.users.include?(current_user))
      end

      @all_watches = Meetup.where(status: "completed", active: true).order(date: :asc).order(time: :asc)
      @watches = []
      @all_watches.each do |meetup|
        @watches << meetup if (meetup.host_id != current_user.id && !meetup.users.include?(current_user))
      end
    else
      redirect_to landing_path
    end
  end

  def landing
  end
end
