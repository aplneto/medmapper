class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.connection.execute('CREATE TABLE hospitals (LIKE
      pharmacies INCLUDING ALL);')
  end
end
