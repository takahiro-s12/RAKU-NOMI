class EventUsersController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event_user = EventUser.new(event_user_params)
    @group = Group.find(params[:group_id])
    if @event_user.save
      @event.create_notification_add_event_user!(current_user)
      redirect_to group_add_user_event_path(@group, @event)
    else
      render 'events/add_user'
    end
  end

  def destroy
  end

  private

  def event_user_params
    params.require(:event_user).permit(:user_id, :event_id)
  end
end
