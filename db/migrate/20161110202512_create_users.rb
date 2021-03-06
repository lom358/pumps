class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, :index=>true, :null=>false, :unique=>true
      t.string :login, :index=>true, :null=>false, :uniqueness=>true
      t.string :password_digest
      t.timestamps
    end
  end
end
