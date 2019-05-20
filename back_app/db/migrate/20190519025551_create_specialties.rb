class CreateSpecialties < ActiveRecord::Migration[5.2]

  # This table is used polymorphicly with all health unit tables
  def change
    create_table :specialties, id: false,
    primay_key: %i[name unit_id unit_type] do |t|
      t.string :name, null: false
      t.integer :unit_id, null: false
      t.string :unit_type, null: false
    end
  end
end
