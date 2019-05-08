class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string  :name,   :limit => 100, null: false
      t.string  :telephone,  :limit => 10, null: false
      t.string  :address,    :limit => 50, null: false
      t.string  :neighborhood,  :limit => 30, null: false
      t.string  :latitude,  :limit => 20, null: false
      t.string  :longitude, :limit => 20, null: false
      t.integer  :region,    :limit => 1, null: false
      t.integer :micro_region,  :limit => 1, null: false
      t.string  :nature,    :limit => 15, null: false
      t.string  :specialties,  :limit => 80, null: false
      t.timestamps
    end
  end
end