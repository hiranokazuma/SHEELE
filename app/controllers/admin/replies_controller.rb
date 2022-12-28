class Admin::RepliesController < ApplicationController
  def new
    @reply = Reply.new
    @message = Message.find(params[:message_id])
    render :new and return if params[:back]
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.admin_id = current_admin.id
    if params[:back] || !@reply.save
      render :new
    else
    @reply.create_notification_admin(current_admin, @reply.user_id)
      redirect_to admin_replies_complete_path
    end
  end

  def confirm
    @reply = Reply.new(reply_params)
    @reply.admin_id = current_admin.id
    @message = Message.find(params[:reply][:message_id])
      if @reply.invalid?
        flash[:arlet] = '入力内容にエラーがあります。'
        render :new
      return
      end
  end

  def complete
  end

  private

  def reply_params
    params.require(:reply).permit(:user_id, :admin_id, :message_id, :content)
  end
end
