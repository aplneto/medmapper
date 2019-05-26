class AddColumnsToHealthUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :health_units, :state, :string
    add_column :health_units, :city, :string
  end
end
