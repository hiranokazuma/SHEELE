class Admin::UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(15)
    # @users = User.all.page(params[:page]).per(15)
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to admin_user_path(@user)
    else
      flash[:arlet] = "変更の保存に失敗しました。"
      render:edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:company_name, :location, :licensing_entity,
                                :licensing_region, :update_number, :license_number,
                                :representatives_name, :telephone_number, :manager_name,
                                :is_deleted, :email)
  end
end
