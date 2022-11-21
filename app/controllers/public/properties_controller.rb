class Public::PropertiesController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
    @property = Property.new
    render :new and return if params[:back]
  end

  def confirm
    @property = Property.new(property_params)
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
      redirect_to properties_complete_path
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
                                      :road_contact, :condition, :release_status, :comment)
  end
end
