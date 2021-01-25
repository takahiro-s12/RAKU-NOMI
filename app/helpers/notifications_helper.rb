module NotificationsHelper
  def notification_form(notification)
    # 内容によって表示を分岐
    case notification.action
    when "follow"
      tag.a(notification.visiter.nickname) + "があなたをフォローしました"
    when "new_group"
      tag.a(notification.visiter.nickname) + "が" + tag.a('グループ', href: group_path(notification.group_id), style: "font-weight: bold;") + "を作成しました"
    when "add_group"
      tag.a(notification.visiter.nickname) + "があなたを" + tag.a('グループ', href: group_path(notification.group_id), style: "font-weight: bold;") + "に招待しました"
    when "new_event"
      tag.a(notification.visiter.nickname) + "が" + tag.a('飲み会', href: group_event_path(notification.group_id, notification.event_id), style: "font-weight: bold;") + "を開催しました"
    when "add_event_user"
      tag.a(notification.visiter.nickname) + "があなたを" + tag.a('飲み会', href: group_event_path(notification.group_id, notification.event_id), style: "font-weight: :bold;") + "に招待しました"
    when "edit_event"
      tag.a('飲み会情報', href: group_event_path(notification.group_id, notification.event_id), style: "font-weight: :bold;") + "が更新されました"
    when "new_question"
      tag.a(notification.visiter.nickname) + "から" + tag.a('アンケート', href: group_path(notification.group_id), style: "font-weight: :bold") + "が届いています"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
