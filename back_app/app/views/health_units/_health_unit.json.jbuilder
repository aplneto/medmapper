json.extract! health_unit, :id, :cnes, :name, :address, :neighborhood, :phone, :latitude, :longitude, :description, :created_at, :updated_at
json.url health_unit_url(health_unit, format: :json)
