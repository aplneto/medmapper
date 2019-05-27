class CreateHealthUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :health_units do |t|
      t.integer :cnes, limit: 7, null: false
      t.string :name, limit: 100, null: false
      t.string :address, limit: 100, null: false
      t.string :neighborhood, limit: 30, null: false
      t.string :phone, limit: 25
      t.float :latitude, limit: 20, null: false
      t.float :longitude, limit: 20, null: false
      t.text :description

      t.timestamps
    end
  end
end
