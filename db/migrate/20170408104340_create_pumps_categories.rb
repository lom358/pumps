class CreatePumpsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :pumps_categories do |t|
      # Заголовок категории
      t.string :title
      # Назначение
      t.text :appointment
      # Варианты изготовления
      t.text :manufacturing_options
      # Условия эксплуатации
      t.text :operating_conditions
      # Тип перегоняемого материала для данной категории (вода, воздух, нефть)
      t.references :type_material, foreign_key: true, :index=>true, :null=>false
      # Максимальная температура перегоняемого вещества(цельсий)
      # Для данной категории
      t.decimal :max_temp_material
      t.attachment :photo
      t.timestamps
    end
  end
end
