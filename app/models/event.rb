class Event < ApplicationRecord
  belongs_to :group
  has_many :event_users
  has_many :users, through: :event_users
  has_many :notifications, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10 }
  validates :date, presence: true

  def create_notification_new_event!(current_user)
    event_users.each do |event_user|
      notification = current_user.active_notifications.new(
        group_id: event_user.event.group_id,
        event_id: id,
        visited_id: event_user.user_id,
        action: 'new_event'
      )
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_add_event_user!(current_user)
    @event_users = EventUser.last(1)
    @event_users.each do |event_user|
      notification = current_user.active_notifications.new(
        group_id: event_user.event.group_id,
        event_id: id,
        visited_id: event_user.user_id,
        action: 'add_event_user'
      )
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_edit_event!(current_user)
    event_users.each do |event_user|
      notification = current_user.active_notifications.new(
        group_id: event_user.event.group_id,
        event_id: id,
        visited_id: event_user.user_id,
        action: 'edit_event'
      )
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end
