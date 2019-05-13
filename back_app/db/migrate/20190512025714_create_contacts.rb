class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts, id: false do |t|
      t.string :contact, :limit => 100, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
   add_index :contacts, :contact, unique: true
  end
end
