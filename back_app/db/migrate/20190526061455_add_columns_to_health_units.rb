class AddColumnsToHealthUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :health_units, :specialties, :text, array: true
    add_column :health_units, :treatment, :text, array: true
  end
end
