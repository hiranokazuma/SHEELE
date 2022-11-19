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
    # (property_params)
  end

  def confirm
  end

  def complete
  end

  # private

  # def property_params
  #   params.require(:property).permit(:type, :right, :prefecture, :municipality,
  #                                     :city_block, :address, :line, :station, :walking_minute,
  #                                     :land_area, :building_area, :price, :sell_category, :age,
  #                                     :structure, :location_floor, :building_coverage_ratio,
  #                                     :floor_area_ratio, :city_planning, :use_area, :legal_restriction,
  #                                     :road_contact, :release_status, :comment)
  # end
end
