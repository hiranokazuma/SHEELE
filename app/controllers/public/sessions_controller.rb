# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
before_action :user_state, only: [:create]

protected

  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    if @user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false)
      flash[:alret] = "退会済みです。再度登録をしてご利用ください。"
      redirect_to new_user_registration_path
    else
      flash[:notice] = "項目を入力してください。"
    end
  end

end
