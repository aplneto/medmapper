Rails.application.routes.draw do

  root 'pages#home'
  
  get '/terms', to: 'pages#terms'
  get '/about', to: 'pages#about'
  get '/collaborators', to: 'pages#collaborators'
  get '/developers', to: 'pages#developers'

  resources :user_profiles, path: 'usuarios'

  resources :professional_profiles, path: 'profissionais'

  resources :service_providers, path: 'servicos'

  resources :health_units, path: 'unidades' do
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

  Rails.application.routes.draw do
    devise_for :accounts, controllers: {
      sessions: 'accounts/sessions',
      omniauth: 'accouts/omniauth',
      confirmations: 'account/confirmations',
      passwords: 'accouts/passwords',
      registrations: 'accouts/registrations',
      unlocks: 'accouts/unlocks'
    }
  end

  resources :maternity_clinics, path: 'maternidades'
  resources :mental_health_units, path: 'saude-mental'
  resources :odontology_units, path: 'odontologia'
  resources :emergency_units, path: 'pronto-atendimento'
  resources :diagnosis_units, path: 'apoio-diagnostico'
  resources :polyclinics, path: 'policlinicas'
  resources :family_health_units, path: 'saude-da-familia'
  resources :basic_health_units, path: 'saude-basica'
  resources :specialized_units, path: 'unidades-especializadas'
  resources :pharmacies, path: 'farmacias'
  resources :hospitals, path: 'hospitais'
  
end
