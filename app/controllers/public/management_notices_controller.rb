class Public::ManagementNoticesController < ApplicationController
  def show
    @management_notice = ManagementNotice.find(params[:id])
  end
end
