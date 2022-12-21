class Public::ViewApplicationsController < ApplicationController
  before_action :set_property, only: [:confirm, :create, :complete]

  def index
    @view_applications = ViewApplication.where.not(user_id: current_user.id)
    @view_application = ViewApplication.new
    @properties = current_user.view_application_properties.select_status("申請中", "許可")
    @user = current_user.id
  end

  def edit
    @view_application = ViewApplication.find(params[:id])
    @property = @view_application.property
    @users = User.all
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
    @property = Property.find_by(id: params[:property_id])
    @view_application = ViewApplication.new
    if @view_application.invalid?
      flash[:arlet] = '入力内容にエラーがあります。'
      render :confirm
    return
    end
  end

  def create
    current_user.create_view_application(@property)
    flash[:success] = "申請しました"
    redirect_to view_applications_complete_url(property_id: params[:property_id])
  end

  def complete
    redirect_to root_url unless @property
  end

  def destroy
    @view_application = ViewApplication.find_by(id: params[:id])
    @view_application.destroy if @view_application
    redirect_to view_applications_path, notice: "閲覧申請を削除しました。"
  end

  private

  def view_application_params
    params.require(:view_application).permit(:user_id, :property_id, :apply_status)
  end

  def set_property
    @property = Property.find_by(id: params[:property_id])
    redirect_to root_url unless @property
  end
end
