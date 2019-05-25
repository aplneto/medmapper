class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places, id: false do |t|
      t.references :professional, foreign_key: true
      t.string :place, null: false, limit: 30

      t.timestamps
    end
    add_index :places, [:professional_id, :place], unique: true
    execute "ALTER TABLE places ADD PRIMARY KEY (professional_id, place);"
  end
end
