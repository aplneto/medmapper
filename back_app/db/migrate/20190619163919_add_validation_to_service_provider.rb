class AddValidationToServiceProvider < ActiveRecord::Migration[5.2]
  def change
    add_column :service_providers, :validation, :boolean, :default => false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
