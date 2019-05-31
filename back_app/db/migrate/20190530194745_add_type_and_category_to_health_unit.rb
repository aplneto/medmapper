class AddTypeAndCategoryToHealthUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :health_units, :type, :string
    add_column :health_units, :category, :string
  end
end