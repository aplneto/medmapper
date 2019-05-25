json.extract! user, :id, :user_name, :email, :sex, :birthday, :encrypted_password, :name, :phone, :description, :created_at, :updated_at
json.url user_url(user, format: :json)
