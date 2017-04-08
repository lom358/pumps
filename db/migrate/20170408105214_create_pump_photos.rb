class CreatePumpPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :pump_photos do |t|
      t.references :pump, foreign_key: true, :index=>true, :null=>false
      t.attachment :photo

      t.timestamps
    end
  end
end
