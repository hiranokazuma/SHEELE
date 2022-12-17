class Public::ViewApplicationsController < ApplicationController
  def index
    @view_applications = ViewApplication.all
    @view_application = ViewApplication.new
    @properties = Property.all
    @user = current_user.id
  end

  def edit
    @view_application = ViewApplication.find(params[:id])
  end

  def update
    @view_application = ViewApplication.find(params[:id])
    if @view_application.update(view_application_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to view_application_path(@view_application)
    else
      flash[:arlet] = "変更の保存に失敗しました。"
      render:edit
    end
  end

  def new
    @view_application = ViewApplication.new
    render :new and return if params[:back]
  end

  def confirm
    @user = current_user
    @property = Property.find_by(params[:id])

    @apply_status = 1
    @view_application = ViewApplication.new
    if @view_application.invalid?
      flash[:arlet] = '入力内容にエラーがあります。'
      render :confirm
    return
    end
  end

  def create
    @view_application = ViewApplication.new(view_application_params)
    if params[:back] || !@view_application.save
      flash[:arlet] = "申請に失敗しました。"
      render :confirm
    else
      @view_application.create_notification_user(current_user)
      redirect_to view_applications_complete_path
    end
  end

  def complete
  end

  def deatroy
    @view_application = ViewApplication.find(params[:id])
    @view_application.destroy
    redirect_to admin_view_applications_path, notice: "閲覧申請を削除しました。"
  end

  private

  def view_application_params
    params.require(:view_application).permit(:user_id, :property_id, :apply_status)
  end
end
