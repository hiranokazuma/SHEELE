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
