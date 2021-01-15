class Question < ApplicationRecord
  belongs_to :group
  has_many :answers, dependent: :destroy
  has_many :users, through: :answers

  def create_notification_question!(current_user)
    group.users.each do |user|
      notification = current_user.active_notifications.new(
        group_id: group.id,
        visited_id: user.id,
        action: "new_question"
      )
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end
