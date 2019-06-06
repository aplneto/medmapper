class CreateServiceProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :service_providers do |t|
      t.string :name, limit: 100, null: false
      t.string :address, limit: 100, null: false
      t.string :neighborhood, limit: 30, null: false
      t.string :phone, limit: 25, null: 20
      t.references :user_profile, foreign_key: true
      t.float :latitude, limit: 20
      t.float :longitude, limit: 20
      t.text :description, limit: 1000

      t.timestamps
    end
    add_index :service_providers, :name, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
