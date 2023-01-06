class Admin::ManagementNoticesController < ApplicationController
  def new
    @management_notice = ManagementNotice.new
    render :new and return if params[:back]
  end

  def create
    @management_notice = ManagementNotice.new(management_notice_params)
    @management_notice.admin_id = current_admin.id
    @users = User.pluck(:id)
    if params[:back] || !@management_notice.save
      render :new
    else
      @management_notice.create_notification_admin(current_admin)
      redirect_to admin_management_notices_complete_path
    end
  end

  def show
    @management_notice = ManagementNotice.find(params[:id])
  end

  def edit
    @management_notice = ManagementNotice.find(params[:id])
  end

  def update
    @management_notice = ManagementNotice.find(params[:id])
    if @management_notice.update(management_notice_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to admin_management_notice_path(@management_notice)
    else
      flash[:arlet] = "変更の保存に失敗しました。"
      render:edit
    end
  end

  def destroy
    @management_notice = ManagementNotice.find(params[:id])
    @management_notice.destroy
    redirect_to admin_messages_path, notice: "物件を削除しました。"
  end

  def confirm
    @management_notice = ManagementNotice.new(management_notice_params)
    @management_notice.admin_id = current_admin.id
    if @management_notice.invalid?
      flash[:arlet] = '入力内容にエラーがあります。'
      render :new
    return
    end
  end

  def complete
  end

  private

  def management_notice_params
    params.require(:management_notice).permit(:admin_id, :user_id, :title, :content)
  end
end
