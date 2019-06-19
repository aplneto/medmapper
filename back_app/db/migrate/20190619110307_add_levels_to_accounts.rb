class AddLevelsToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :admin, :boolean
    add_column :accounts, :professional, :boolean
    add_column :accounts, :collaborator, :boolean
  end
end
