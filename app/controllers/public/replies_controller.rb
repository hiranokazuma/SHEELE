class Public::RepliesController < ApplicationController
  def new
  end

  def create
  end

  def confirm
  end

  def complete
  end

  def show
    @reply = Reply.find(params[:id])
    # @notification = Notification.reply.find_by(id: params[:reply_id])
    # Notification.reply.update(read: true)
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to messages_path, notice: "返信を削除しました。"
  end

  private

  def reply_params
    params.require(:reply).permit(:user_id, :admin_id, :message_id, :content)
  end

end
