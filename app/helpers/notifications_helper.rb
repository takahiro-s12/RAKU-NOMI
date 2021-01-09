module NotificationsHelper

  def notification_form(notification)
    @visiter = notification.visiter
    #内容によって表示を分岐
    case notification.action
      when "add_group" then
        tag.a(notification.visiter.name) + "があなたを" + tag.a( 'グループ', href:group_path(notification.group_id), style: "font-weight: bold;") + "に招待しました"
    end
  end

  def unchecked_notifications
    #@notifications = current_user.passive_notifications.where(checked: false)
  end

end
