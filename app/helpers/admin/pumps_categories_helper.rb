module Admin::PumpsCategoriesHelper
  def get_type_materials
    TypeMaterial.all.select(:name, :id).load.collect {|p| [ p.name, p.id ] }
  end
end
