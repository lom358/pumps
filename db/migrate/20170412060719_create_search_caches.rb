class CreateSearchCaches < ActiveRecord::Migration[5.0]
  def change
    create_table :search_caches do |t|
      t.string :query
      t.text :result

      t.timestamps
    end
  end
end
