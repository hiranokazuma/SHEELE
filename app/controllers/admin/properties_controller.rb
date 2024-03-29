class Admin::PropertiesController < ApplicationController
  before_action :authenticate_admin!, except: [:top]

  def index
    @property = Property.new
    # @properties = Property.where(sell_category: params[:q][:sell_category]).page(params[:page]).per(15)
    @q = Property.ransack(params[:q])
    @properties = @q.result(distinct: true).page(params[:page]).per(15)
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
      redirect_to admin_property_path(@property)
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
  private

  def property_params
    params.require(:property).permit(:user_id, :kind, :right, :building_name, :prefecture, :municipality,
                                      :city_block, :address, :line, :station, :walking_minute,
                                      :land_area, :land_of_co_ownership, :building_area, :floor_plan, :price,
                                      :sell_category, :age, :structure, :location_floor, :building_coverage_ratio,
                                      :floor_area_ratio, :city_planning, :use_area, :legal_restriction,
                                      :road_contact, :condition, :release_status, :comment, :image)
  end
end
