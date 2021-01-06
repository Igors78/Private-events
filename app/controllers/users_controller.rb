class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  def show
    @user = User.find(params[:id])
    @events = Event.all
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the app!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to root_path
  end

  def accept_invite
    @event = Event.find(params[:event_id])
    @user = User.find(params[:id])
    @user.attended_events << @event
    @event.invited_users.delete(@user)
    flash[:success] = ' Invite Accepted!!!'
    redirect_to "/users/#{@user.id}"
  end

  def decline_invite
    @event = Event.find(params[:event_id])
    @user = User.find(params[:id])
    @user.attended_events.delete(@event)
    @event.invited_users << @user
    flash[:danger] = ' Invite Declined!!!'
    redirect_to "/users/#{@user.id}"
  end

  def dismiss_invite
    @event = Event.find(params[:id])
    @user = User.find(params[:user_id])
    @user.attended_events.delete(@event)

    flash[:danger] = ' Invite Dismissed!!!'
    redirect_to "/events/#{@event.id}"
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
