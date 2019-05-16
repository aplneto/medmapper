class CreateProfessionals < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :occupation, :string, :limit => 25
    add_column :users, :registry, :string, :limit => 25
    add_column :users, :description, :string, :limit => 140
    add_column :users, :homecare, :boolean
  end
end
