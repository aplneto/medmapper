class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.references :health_unit, foreign_key: true
      t.string :type

      t.timestamps
    end
    #Ex:- add_index("admin_users", "username")
  end
end
