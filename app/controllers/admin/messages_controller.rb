class Admin::MessagesController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(15)

    @messages = Message.all
    @message = Message.new
  end

  def new
    @message = Message.new
    @users = User.all
    @admin = current_admin
  end

  def create
    @message = Message.new(message_params)

    if @message.save
    flash[:success] = 'メッセージを送信しました。'
    redirect_to admin_messages_path
    else
    flash[:danger] = 'メッセージを送信できませんでした。'
    render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to admin_messages_path
  end

  private

  def message_params
    params.require(:message).permit(:kind, :title, :content)
  end

  def get_users
    render partial: 'select_users', locals: {user_id: params[:user_id]}
  end

end
