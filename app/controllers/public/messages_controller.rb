class Public::MessagesController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(15)

    @messages = Message.all
    @message = Message.new
  end

  def new
    @message = Message.new
    @user = current_user

  end

  def create
    @message = Message.new
    # @user = User.find(params[:user_id])
    # @admin = Admin.find(params[:admin_id])
    # @message = current_user.messages.build(message_params)
    # @message = @admin.messages.build(message_params)
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
    redirect_back(fallback_location: root_path)
  end

  private

  def message_params
    params.require(:message).permit(:kind, :title, :content)
  end

  def get_users
    render partial: 'select_users', locals: {user_id: params[:user_id]}
  end
end
