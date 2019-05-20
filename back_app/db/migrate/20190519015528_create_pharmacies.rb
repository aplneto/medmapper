class CreatePharmacies < ActiveRecord::Migration[5.2]
  def change
    create_table :pharmacies do |t|
      t.integer :cnes, limit: 7, null: false
      t.string :name, limit: 80, null: false
      t.string :address, limit: 50, null: false
      t.string :neighborhood, limit: 30, null: false
      t.string :phone, limit: 25, null: false
      t.float :latitude, limit: 20, null: false
      t.float :longitude, limit: 20, null: false
      t.string :type, null: false

      t.timestamps
    end
    add_index :pharmacies, :cnes, :unique => true
    add_index :pharmacies, :type
  end
end
