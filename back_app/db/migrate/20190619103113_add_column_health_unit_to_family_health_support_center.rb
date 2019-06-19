class AddColumnHealthUnitToFamilyHealthSupportCenter < ActiveRecord::Migration[5.2]
  def change
    add_reference :family_health_support_centers, :health_unit, foreign_key: true
  end
end
