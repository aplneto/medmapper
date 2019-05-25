class CreateBasicHealthUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :basic_health_units do |t|
      t.references :health_unit, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
