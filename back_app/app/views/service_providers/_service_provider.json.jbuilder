json.extract! service_provider, :id, :name, :address, :neighborhood, :phone, :user_id, :description, :created_at, :updated_at
json.url service_provider_url(service_provider, format: :json)
