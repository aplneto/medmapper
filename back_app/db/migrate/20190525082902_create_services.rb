class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services, id: false do |t|
      t.integer :provider_id
      t.string :provider_type
      t.string :tag, limit: 50

      t.timestamps
    end
    execute "ALTER TABLE services ADD PRIMARY KEY 
    (provider_id, provider_type, tag);"
  end
end
