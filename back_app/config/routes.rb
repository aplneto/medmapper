Rails.application.routes.draw do

  devise_for :users

  resources :service_providers
  resources :professionals
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
      post :basic_search, path: 'resultados'
      post :list_by_specialties, path: 'especialidades'
      post :list_by_treatments, path: 'atendimentos'
      post :search_by_neighborhood, path: 'bairro'
    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#index"
end
