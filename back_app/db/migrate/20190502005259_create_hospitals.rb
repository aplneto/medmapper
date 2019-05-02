class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals, id: false do |t|
      t.integer :register,  :limit => 8, null: false
      t.string  :name,   :limit => 30, null: false
      t.string  :sex,  :limit => 1, null: false
      t.string  :telephone,  :limit => 11, null: false
      t.string  :street,    :limit => 20, null: false
      t.integer :number,    :limit => 5, null: false
      t.string  :neighborhood,  :limit => 10, null: false
      t.string  :latitude,  :limit => 20, null: false
      t.string  :longitude, :limit => 20, null: false
      t.string  :region,    :limit => 5, null: false
      t.string  :micro_region,  :limit => 10, null: false
      t.string  :nature,    :limit => 10, null: false
      t.string  :type,  :limit => 10, null: false
      t.timestamps
    end
    add_index :hospitals, :register, unique: true
  end
end
