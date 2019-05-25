Rails.application.routes.draw do

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
  resources :health_units
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
