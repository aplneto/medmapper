class CreatePharmacies < ActiveRecord::Migration[5.2]
  def change
    create_table :pharmacies do |t|
      t.references :health_unit, foreign_key: true

      t.timestamps
    end
  end
end
