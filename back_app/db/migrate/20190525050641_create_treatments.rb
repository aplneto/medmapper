class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments, id: false do |t|
      t.references :health_unit, foreign_key: true
      t.string :treatment

      t.timestamps
    end
    add_index :treatments, [:health_unit_id, :treatment], unique: true
    execute "ALTER TABLE treatments ADD PRIMARY KEY (health_unit_id, treatment);"
  end
end