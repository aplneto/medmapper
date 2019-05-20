class CreateSpecializedUnits < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.connection.execute('CREATE TABLE specialized_units (LIKE
      pharmacies INCLUDING ALL);')
  end
end