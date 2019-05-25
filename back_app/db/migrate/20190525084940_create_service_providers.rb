class CreateServiceProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :service_providers do |t|
      t.string :name, null:false, limit: 80
      t.string :address, null:false, limit: 50
      t.string :neighborhood, null:false, limit: 30
      t.string :phone, null:false, limit: 25
      t.references :user, foreign_key: true
      t.text :description

      t.timestamps
    end
    add_index :service_providers, :name, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
