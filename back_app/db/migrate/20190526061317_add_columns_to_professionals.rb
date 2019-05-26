class AddColumnsToProfessionals < ActiveRecord::Migration[5.2]
  def change
    add_column :professionals, :places, :text, array: true
    add_column :professionals, :contacts, :text, array: true
    add_column :professionals, :services, :text, array: true
  end
end
