class ChangeColunsOnProfessionalProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :professional_profiles, :contacts
    remove_column :professional_profiles, :places
    remove_column :professional_profiles, :services
    add_column :professional_profiles, :contacts, :text, array: true
    add_column :professional_profiles, :places, :text, array: true
    add_column :professional_profiles, :services, :text, array: true
  end
end
