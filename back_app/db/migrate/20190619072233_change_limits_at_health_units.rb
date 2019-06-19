class ChangeLimitsAtHealthUnits < ActiveRecord::Migration[5.2]
  def change
    change_column :health_units, :name, :string, :limit => 255
    change_column :health_units, :address, :string, :limit => 255
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
