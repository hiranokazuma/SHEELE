class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]

  def top
  end

  def show
    # @user = current_user
    @user = User.find(params[:id])
    @currentRoomUser = RoomUser.where(user_id: current_user.id)  #current_userが既にルームに参加しているか判断
    @receiveUser = RoomUser.where(user_id: @user.id)  #他の@userがルームに参加しているか判断

    unless @user.id == current_user.id  #current_userと@userが一致していなければ
      @currentRoomUser.each do |currentRoomUser|  #current_userが参加しているルームを取り出す
        @receiveUser.each do |receiveUser|  #@userが参加しているルームを取り出す
          if currentRoomUser.room_id == receiveUser.room_id  #current_userと@userのルームが同じか判断(既にルームが作られているか)
            @haveRoom = true  #falseの時(同じじゃない時)の条件を記述するために変数に代入
            @RoomId = currentRoomUser.room_id  #ルームが共通しているcurrent_userと@userに対して変数を指定
          end
        end
      end
      unless @haveRoom  #ルームが同じじゃなければ
        #新しいインスタンスを生成
        @room = Room.new
        @RoomUser = RoomUser.new
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to users_information_path(current_user)
    else
      flash[:arlet] = "変更に失敗しました。"
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:company_name, :location, :licensing_entity,
                                :licensing_region, :update_number, :license_number,
                                :representatives_name, :telephone_number, :manager_name,
                                :is_deleted, :email)
  end
end
