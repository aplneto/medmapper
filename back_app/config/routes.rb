Rails.application.routes.draw do

  resources :polyclinics
  resources :maternity_clinics
  resources :mental_health_units
  resources :odontology_units
  resources :emergency_units
  resources :diagnosis_units
  resources :family_health_units
  resources :specialized_units
  resources :basic_health_units
  resources :hospitals
  resources :pharmacies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
