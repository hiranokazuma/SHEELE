class Admin::ViewApplicationsController < ApplicationController
  def index
    @view_applications = ViewApplication.all
    @view_application = ViewApplication.new
    @properties = Property.all
    @users = User.all
  end

  def edit
    @view_application = ViewApplication.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def view_application_params
    params.require(:view_application).permit(:user_id, :property_id, :apply_status)
  end
end
