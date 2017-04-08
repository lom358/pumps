class CreateTypeMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :type_materials do |t|
      # Системный код типа обрабатываемого материала нососами
      t.integer :code, :index=>true, :null=>false, :unique=>true
      # Человеческое название типа материала (вода, воздух, нефть)
      t.string :name, :index=>true, :null=>false, :unique=>true

      t.timestamps
    end
  end
end
