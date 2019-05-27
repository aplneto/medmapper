class FixTreatmentsName < ActiveRecord::Migration[5.2]
  def change
    rename_column :health_units, :treatment, :treatments
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
