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
  end

  def destroy
    @reply = Reply.find(params[:id])
  end

  private

  def reply_params
    params.require(:reply).permit(:user_id, :admin_id, :message_id, :content)
  end

end
