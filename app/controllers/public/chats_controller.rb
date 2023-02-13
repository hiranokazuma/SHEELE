class Public::ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    if RoomUser.where(user_id: current_user.id, room_id: params[:chat][:room_id]).present?
      @chat = Chat.create(chat_params)
      redirect_to room_path(@chat.room_id)
    else
      flash[:alert] = "メッセージの送信に失敗しました。"
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:user_id, :room_id, :text).merge(user_id: current_user.id)
  end
end
