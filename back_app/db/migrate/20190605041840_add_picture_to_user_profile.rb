class AddPictureToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :picture, :binary, limit: 12000
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    add_index :user_profiles, :picture
    #Ex:- add_index("admin_users", "username")
  end
end
