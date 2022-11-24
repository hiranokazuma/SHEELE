class Public::ViewApplicationsController < ApplicationController
  def index
    @view_applications = ViewApplication.all
    @view_application = ViewApplication.new
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

  # def new
  #   @view_application = ViewApplication.new
  #   render :new and return if params[:back]
  # end

  def confirm
    @user = current_user
    @properties = Property.all
    @property = Property.new
    @view_application = ViewApplication.new
    # if @view_application.invalid?
    #   flash[:arlet] = '入力内容にエラーがあります。'
    #   render :index
    # return
    # end
  end

  def create
    @view_application = ViewApplication.new(view_application_params)
    if params[:back] || !@view_application.save
      render :confirm
    else
      redirect_to view_applications_complete_path
    end
  end

  def complete
  end

  def deatroy
  end
  private

  def view_application_params
    params.require(:view_application).permit(:user_id, :property_id, :apply_status)
  end
end
