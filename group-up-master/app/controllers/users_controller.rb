class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @users = User.search_by_first_name_and_last_name(params[:query])
    else
      @users = User.all
    end
    @meetup = Meetup.all
  end

  def show
    @number_of_meetups = 0
    @number_of_meetups += Meetup.where(host: @user).count
    @number_of_meetups += @user.meetups.count
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def create
    @user = current_user.users.build(user_params)
    if @user.save
      userMailer.creation_confirmation(@user).deliver_now
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description, :skill_level, :photo)
  end
end
