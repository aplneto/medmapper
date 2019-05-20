Rails.application.routes.draw do

  resources :specialized_units
  resources :basic_health_units
  resources :hospitals
  resources :pharmacies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
