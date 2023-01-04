class Public::RepliesController < ApplicationController

  def show
    @reply = Reply.find(params[:id])
    @reply.notifications.update(read: true)
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
