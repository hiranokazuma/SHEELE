class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]

  def top
  end

  def show
    # @user = current_user
    @user = User.find(params[:id])

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
