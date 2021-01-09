class Group < ApplicationRecord

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :notifications, dependent: :destroy

  def create_notification_add_user!(current_user)
    @group_users = GroupUser.last(1)
    @group_users.each do |group_user|
      notification = current_user.active_notifications.new(
        group_id: id,
        visited_id: group_user.user_id,
        action: 'add_group'
      )
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_new_group!(current_user)
    group_users.each do |group_user|
      notification = current_user.active_notifications.new(
        group_id: id,
        visited_id: group_user.user_id,
        action: 'new_group'
      )
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end
