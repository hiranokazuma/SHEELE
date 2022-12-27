class Admin::ViewApplicationsController < ApplicationController
  def index
    @view_applications = ViewApplication.all
    @view_application = ViewApplication.new
    @properties = Property.all
    @users = User.all
  end

  def edit
    @view_application = ViewApplication.find(params[:id])
    @property = Property.find_by(id: params[:property_id])
  end

  def update
    @view_application = ViewApplication.find(params[:id])
    if @view_application.update(property_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to admin_view_application_path(@view_application)
    else
      flash[:arlet] = "変更の保存に失敗しました。"
      render:edit
    end
  end

  def destroy
    @view_application = ViewApplication.find(params[:id])
    @view_application.destroy
    redirect_to admin_view_applications_path, notice: "閲覧申請を削除しました。"
  end

  private

  def view_application_params
    params.require(:view_application).permit(:user_id, :property_id, :apply_status)
  end
end
