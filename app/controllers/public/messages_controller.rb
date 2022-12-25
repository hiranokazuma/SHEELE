class Public::MessagesController < ApplicationController
  def index
    @replies = Reply.all
    @management_notices = ManagementNotice.all
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)

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
    params.require(:message).permit(:title, :content)
  end

  def get_users
    render partial: 'select_users', locals: {user_id: params[:user_id]}
  end
end
