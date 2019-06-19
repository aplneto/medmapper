class AddSocialMediaColumnsToProfessionalProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :professional_profiles, :facebook, :string
    add_column :professional_profiles, :lattes, :string
    add_column :professional_profiles, :instagram, :string
    add_column :professional_profiles, :linkedin, :string
    add_column :professional_profiles, :whatsapp, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
