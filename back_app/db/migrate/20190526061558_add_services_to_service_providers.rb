class AddServicesToServiceProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :service_providers, :services, :text, array:true
  end
end
