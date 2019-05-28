json.extract! service_provider, :id, :name, :address, :neighborhood, :phone, :user_profile_id, :latitude, :longitude, :description, :created_at, :updated_at
json.url service_provider_url(service_provider, format: :json)
