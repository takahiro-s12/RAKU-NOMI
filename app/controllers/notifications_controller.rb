class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(8)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy_all
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to notifications_path
  end
end
