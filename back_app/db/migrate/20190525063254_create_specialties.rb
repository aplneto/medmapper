class CreateSpecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :specialties, id: false do |t|
      t.references :health_unit, foreign_key: true
      t.string :specialty

      t.timestamps
    end
    add_index :specialties, [:health_unit_id, :specialty], unique: true
    execute "ALTER TABLE specialties ADD PRIMARY KEY (health_unit_id, specialty);"
  end
end
