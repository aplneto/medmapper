class AddColumnsToHealthUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :health_units, :state, :string, limit: 50
    add_column :health_units, :city, :string, limit: 50
  end
end
