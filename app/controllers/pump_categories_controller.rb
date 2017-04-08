class PumpCategoriesController < ApplicationController

  def index
    @pump_categories = PumpsCategory.all.load
  end

end