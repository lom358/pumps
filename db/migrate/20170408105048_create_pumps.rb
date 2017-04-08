class CreatePumps < ActiveRecord::Migration[5.0]
  def change
    create_table :pumps do |t|
      # Связь насоса к категории
      t.references :pumps_category, foreign_key: true, :index=>true, :null=>false
      # Маркировка насоса
      t.string :mark
      # Подача(m^3/hour)
      t.decimal :supply
      # напор(м)
      t.integer :push
      # Двигатель (кВт)
      t.decimal :engine
      # Максимальная темература перегоняемого вещества в Цельсиях
      t.decimal :max_temp_material
      # Показывать в результатах? Альтернатива удалению из бд.
      t.boolean :show, :default=>true
      # Описание насососа.
      t.text :description

      t.timestamps
    end
  end
end
