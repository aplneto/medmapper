class RenameClassTypeToGovernance < ActiveRecord::Migration[5.2]
  def change
    rename_column :health_units, :class_type, :governance
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
