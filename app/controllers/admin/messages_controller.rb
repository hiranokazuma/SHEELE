class Admin::MessagesController < ApplicationController
  def index
    @users = User.all
    @admin = current_admin
    @messages = Message.all
    @message = Message.new
  end

  def create
    @user = User.find(params[:user_id])
    @admin = Admin.find(params[:admin_id])
    @message = current_user.messages.build(message_params)
    @message = @admin.messages.build(message_params)
    if @message.save
    flash[:success] = 'メッセージを送信しました。'
    redirect_back(fallback_location: root_path)
    else
    flash[:danger] = 'メッセージを送信できませんでした。'
    redirect_back(fallback_location: root_path)
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def message_params
    params.require(:message).permit(:title, :content)
  end
end
