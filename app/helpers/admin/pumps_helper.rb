module Admin::PumpsHelper
  def get_pumps_categories
    PumpsCategory.all.select(:title, :id).load.collect {|p| [ p.title, p.id ] }
  end
end
