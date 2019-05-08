class CorrectingHospitalTable < ActiveRecord::Migration[5.2]
  def change
    remove_index :hospitals, :registry
    remove_column :hospitals, :registry
    add_column :hospitals, :id, :bigint
    add_index :hospitals, :id, , null: false, unique: true
  end
end
