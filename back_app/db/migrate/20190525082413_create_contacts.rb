class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts, id: false do |t|
      t.references :professional, foreign_key: true
      t.string :category, limit: 50
      t.string :info, limit: 80

      t.timestamps
    end
    execute "ALTER TABLE contacts ADD PRIMARY KEY (professional_id,
     category, info);"
  end
end
