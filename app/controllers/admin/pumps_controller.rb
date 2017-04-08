class Admin::PumpsController <  Admin::AdminController

  before_action :set_pump, :only => [:show, :edit, :update]

  def index
    @pumps = Pump.all.load
  end

  def new
    @pump = Pump.new
  end

  def create
    @pump = Pump.new(pumps_params)
    respond_to do |format|
      if @pump.save
        pp = PumpPhoto.new(pump_photo_params)
        pp.pump = @pump
        if pp.save
          format.html { redirect_to [:admin, @pump], notice: 'Object was successfully created.' }
          format.json { render action: 'show', status: :created, location: @pump }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @pump.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def edit

  end

  def update

  end


private

  def set_pump
    @pump = Pump.find(params[:id].to_i)
  end

  def pumps_params
    params.require(:pump).permit(:mark, :description, :pumps_category_id, :supply, :push, :engine, :max_temp_material, :show)
  end

  def pump_photo_params
    params.require(:pump).permit(:photo)
  end

end