Rails.application.routes.draw do

  resources :professional_profiles
  resources :service_providers
  resources :user_profiles
  devise_for :accounts
  root 'pages#home'
  
  get '/about', to: 'pages#about'

  resources :maternity_clinics
  resources :mental_health_units
  resources :odontology_units
  resources :emergency_units
  resources :diagnosis_units
  resources :polyclinics
  resources :family_health_units
  resources :basic_health_units
  resources :specialized_units
  resources :pharmacies
  resources :hospitals

  resources :health_units do
    collection do
      resources :comments, path: 'comentarios'
      get :basic_search, path: 'resultados'
      get :advanced_search, path: 'pesquisar'
      get :list_by_specialties, path: 'especialidades', as: :specialty
      get :list_by_treatments, path: 'atendimentos', as: :treatments
      get :search_by_neighborhood, path: 'bairro', as: :neighborhood
    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
