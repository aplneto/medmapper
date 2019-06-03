class CreateFamilyHealthSupportCenters < ActiveRecord::Migration[5.2]
  def change
    create_table :family_health_support_centers do |t|
      t.string :team, limit: 10, null: false
      t.string :support_point, limit: 50, null: false
      t.string :name, limit: 80, null: false
      t.string :area, limit: 50, null: false
      t.string :phone, limit: 25
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.integer :district, null: false

      t.timestamps
    end
  end
end
