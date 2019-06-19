class AddServicesToServiceProvider < ActiveRecord::Migration[5.2]
  def change

    add_column :service_providers, :services, :text, array: true
    add_column :service_providers, :image, :string
    add_column :service_providers, :webpage, :string

  end
end
