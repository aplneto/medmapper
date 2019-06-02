class AddIndexesToHealthUnit < ActiveRecord::Migration[5.2]
  def change
    add_index :health_units, :type
    add_index :health_units, :category
  end
end
