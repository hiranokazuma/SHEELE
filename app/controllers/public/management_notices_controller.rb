class Public::ManagementNoticesController < ApplicationController
  def show
    @management_notice = ManagementNotice.find(params[:id])
    @management_notice.notifications.update(read: true)
  end
end
