json.extract! user_profile, :id, :name, :sex, :birthday, :phone, :description, :account_id, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
