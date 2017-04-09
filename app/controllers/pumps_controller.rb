class PumpsController < ApplicationController

  before_action :set_pump, :only => [:show]

  def index
    @pumps = Pump.all.load
  end

  def show

  end

private

  def set_pump
    @pump = Pump.find(params[:id].to_i)
  end

end