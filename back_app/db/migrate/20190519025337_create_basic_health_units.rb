class CreateBasicHealthUnits < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.connection.execute('CREATE TABLE basic_health_units (LIKE
      pharmacies INCLUDING ALL);')
  end
end
