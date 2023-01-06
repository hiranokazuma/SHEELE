class Public::MessagesController < ApplicationController
  def index
    @replies = Reply.all
    @management_notices = ManagementNotice.all
    ids = Notification.where(visitor_id: current_user).pluck(:id)
    apply_notification = Notification.where(read: :false).where(id: (current_user.passive_notifications.pluck(:id) - ids)).where(notice_type: :apply).first
    reply_notification = Notification.where(read: :false).where(id: (current_user.passive_notifications.pluck(:id) - ids)).where(notice_type: :reply).first
    # management_notice_notification = Notification.where(read: :false).where(notice_type: :management_notice).first
    management_notice_notification = Notification.where(read: :false).where(id: (current_user.passive_notifications.pluck(:id) - ids)).where(notice_type: :management_notice).first
    @notifications = [apply_notification, reply_notification, management_notice_notification].compact
    # @notifications = Notification.where(read: :false).where(id: (current_user.passive_notifications.pluck(:id) - ids)).page(params[:page]).per(20)
    @q = Message.ransack(params[:q])
    @messages = @q.result(distinct: true).page(params[:page]).per(15)
  end

  def new
    @message = Message.new
    @user = current_user

  end

  def update
    Notification.find(params[:id]).update(read: true)
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      @message.create_notification_user(current_user, @message.admin_id)
      flash[:success] = 'メッセージを送信しました。'
      redirect_to messages_path
    else
      flash[:danger] = 'メッセージを送信できませんでした。'
      render :new
    end
  end

  def show
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :admin_id)
  end

end
