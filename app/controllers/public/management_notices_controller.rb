class Public::ManagementNoticesController < ApplicationController
  def show
    @management_notice = ManagementNotice.find(params[:id])
    @management_notice.notifications.where(visited_id: current_user.id).update(read: true)
  end
end
