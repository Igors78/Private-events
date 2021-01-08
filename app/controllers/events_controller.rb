class EventsController < ApplicationController
  before_action :set_event,
                only: %i[show edit update destroy invite_user dismiss_user]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @users = User.all
  end

  # GET /events/new
  def new
    @event = current_user.events.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event has been created!'
      redirect_to @event
    else
      render 'new'
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = current_user.events.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = 'Event updated'
      redirect_to @event
    else
      render 'edit'
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = current_user.events.find(params[:id])
    if @event
      @event.destroy
      flash[:success] = 'Event has been deleted'
    else
      flash[:alert] = 'Error'
    end
    redirect_to root_path
  end

  def invite_user
    @user = User.find(params[:user_id])
    @event.invited_users << @user
    flash[:success] = " #{@user.name} invited!!!"
    redirect_to "/events/#{@event.id}"
  end

  def dismiss_user
    @user = User.find(params[:user_id])

    @event.invited_users.delete(@user)
    flash[:danger] = " #{@user.name} dismissed!!!"
    redirect_to "/events/#{@event.id}"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:description, :location, :date)
  end
end
