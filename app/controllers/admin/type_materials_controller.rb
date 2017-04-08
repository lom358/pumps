# Материалы являются константами внутри системы
# Так как от них зависят списки насосов
# Потому есть возможность только создание и просмотр типов материалов
class Admin::TypeMaterialsController <  Admin::AdminController

  def index
    @type_materials = TypeMaterial.all.load
  end

  def new
    @type_material = TypeMaterial.new
  end

  def create
    @type_material = TypeMaterial.new(type_material_params)
    respond_to do |format|
      if @type_material.save
        format.html { redirect_to action: 'index', notice: 'Object was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @type_material.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def type_material_params
    params.require(:type_material).permit(:code, :name)
  end

end