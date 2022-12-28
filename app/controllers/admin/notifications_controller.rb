class Admin::NotificationsController < ApplicationController
  def index
    @notifications = current_admin.passive_notifications.page(params[:page]).per(20)
    @notifications.where(read: false).each do |notification|
      notification.update(read: true)
    end
  end

  def destroy
  end
end
