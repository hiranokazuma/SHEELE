class Public::PropertiesController < ApplicationController
  def index
    @q = Property.ransack(params[:q])
    @properties = @q.result(distinct: true).page(params[:page]).per(15)
    @property = Property.new
    @view_applications = ViewApplication.all
  end

  def myproperties
    @q = Property.where(user: current_user).ransack(params[:q])
    @properties = @q.result(distinct: true).page(params[:page]).per(15)
    @property = Property.new
    @view_applications = current_user.view_applications.includes(:property)
  end

  def view_applications
    @view_application = ViewApplication.find_by(id: params[:view_application_id])
    @property = Property.find(params[:id])
    @view_applications = @property.view_applications
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])

  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to property_path(@property)
    else
      flash[:arlet] = "変更の保存に失敗しました。"
      render:edit
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to admin_properties_path, notice: "物件を削除しました。"
  end

  def new
    @property = Property.new
    render :new and return if params[:back]
  end

  def confirm
    @property = Property.new(property_params)
    @property.user_id = current_user.id
      if @property.invalid?
        flash[:arlet] = '入力内容にエラーがあります。'
        render :new
      return
      end
  end

  def create
    @property = Property.new(property_params)
    if params[:back] || !@property.save
      render :new
    else
      redirect_to properties_complete_path(@property.id)
    end
  end

  def complete
  end

  private

  def property_params
    params.require(:property).permit(:user_id, :kind, :right, :prefecture, :municipality,
                                      :city_block, :address, :line, :station, :walking_minute,
                                      :land_area, :building_area, :price, :sell_category, :age,
                                      :structure, :location_floor, :building_coverage_ratio,
                                      :floor_area_ratio, :city_planning, :use_area, :legal_restriction,
                                      :road_contact, :condition, :release_status, :comment, :image)
  end
end
