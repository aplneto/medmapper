class RenameColumnCategoryToClass < ActiveRecord::Migration[5.2]
  def change
    rename_column :health_units, :category, :class_type
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
