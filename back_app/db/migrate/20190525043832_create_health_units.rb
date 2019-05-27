class CreateHealthUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :health_units do |t|
      t.integer :cnes, limit: 7, null: false
      t.string :name, limit: 80, null: false
      t.string :address, limit: 50, null: false
      t.string :neighborhood, limit: 30, null: false
      t.string :phone, limit: 25, null: false
      t.float :latitude, limit: 20, null: false
      t.float :longitude, limit: 20, null: false
      t.text :description

      t.timestamps
    end
    add_index :health_units, :cnes, unique: true
  end
end