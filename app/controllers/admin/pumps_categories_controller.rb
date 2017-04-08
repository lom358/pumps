class Admin::PumpsCategoriesController <  Admin::AdminController

  before_action :set_pump_category, :only => [:update, :show, :edit]

  def index
    @pump_categories = PumpsCategory.all.load
  end

  def new
    @pump_category = PumpsCategory.new
  end

  def create
    @pump_category = PumpsCategory.new(pumps_category_params)
    respond_to do |format|
      if @pump_category.save
        format.html { redirect_to [:admin, @pump_category], notice: 'Object was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pump_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @pump_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @pump_category.update(pumps_category_params)
        format.html { redirect_to [:admin, @pump_category], notice: 'Pump category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pump_category.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def set_pump_category
    @pump_category = PumpsCategory.find(params[:id].to_i)
  end

  def pumps_category_params
    params.require(:pumps_category).permit(:title, :appointment, :manufacturing_options, :operating_conditions, :type_material_id, :max_temp_material, :photo)
  end

end