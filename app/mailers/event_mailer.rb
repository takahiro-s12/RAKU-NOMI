class EventMailer < ApplicationMailer
  def event_confirm(event_user)
    @event_user = event_user
    @event = Event.find(event_user.event_id)
    @admin = User.find(@event.user_id)
    user = User.find(event_user.user_id)
    mail to: user.email, subject: "飲み会の詳細に関して"
  end
end
