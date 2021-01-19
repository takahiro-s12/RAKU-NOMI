class EventsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.new
    @group = Group.find(params[:group_id])
    @users = @group.users
  end

  def create
    @event = Event.new(event_params)
    @group = Group.find(params[:group_id])
    @event.group_id = @group.id
    @event.user_id = current_user.id
    @users = @group.users
    if @event.save
      @event.create_notification_new_event!(current_user)
      redirect_to group_event_path(@group.id, @event.id)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @group = Group.find(params[:group_id])
    @event_users = EventUser.where(event_id: @event.id)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @group = Group.find(params[:group_id])
    if @event.update(event_params)
      @event.create_notification_edit_event!(current_user)
      redirect_to group_event_path(@group.id, @event.id)
    else
      render :edit
    end
  end

  def add_user
    @event = Event.find(params[:id])
    @group = Group.find(params[:group_id])
    @event_user = EventUser.new
  end

  def event_mail
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:id])
  end

  def event_confirm
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:id])
    @event_users = EventUser.where(event_id: @event.id)
    @event_users.each do |event_user|
      EventMailer.event_confirm(event_user).deliver
    end
  end


  private

  def event_params
    params.require(:event).permit(:user_id,
                                  :name,
                                  :venue_name,
                                  :venue_address,
                                  :date, :start_time,
                                  :finish_time, :cost,
                                  :site_url,
                                  :comment,
                                  user_ids: [])
  end
end
