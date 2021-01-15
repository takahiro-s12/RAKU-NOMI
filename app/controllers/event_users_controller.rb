class EventUsersController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event_user = EventUser.new(event_user_params)
    @group = Group.find(params[:group_id])
    @event_user.save
    @event.create_notification_add_event_user!(current_user)
  end

  def destroy
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:event_id])
    EventUser.find(params[:id]).destroy
    @event_users = EventUser.where(event_id: @event.id)
  end

  private

  def event_user_params
    params.require(:event_user).permit(:user_id, :event_id)
  end
end
