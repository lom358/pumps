class PumpsCategoriesController < ApplicationController

  before_action :set_pump_category, :only => [:show]

  def index
    @pump_categories = PumpsCategory.all.load
  end

  def show
  end

private

  def set_pump_category
    @pump_category = PumpsCategory.find(params[:id].to_i)
  end

  def pumps_category_params
    params.require(:pumps_category).permit(:title, :appointment, :manufacturing_options, :operating_conditions, :type_material_id, :max_temp_material, :photo)
  end

end