class Group < ApplicationRecord

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :notifications, dependent: :destroy

  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      group_id: id,
      visited_id: user_id,
      action: "add_group"
    )
    notification.save if notification.valid?
  end

end
