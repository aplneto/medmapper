Rails.application.routes.draw do

  root to: 'pages#home'
  
  get '/terms', to: 'pages#terms'
  get '/about', to: 'pages#about'
  get '/collaborators', to: 'pages#collaborators'
  get '/developers', to: 'pages#developers'

  resources :user_profiles, path: 'usuarios'

  devise_for :accounts, controllers: {
    sessions: 'accounts/sessions',
    confirmations: 'accounts/confirmations',
    passwords: 'accounts/passwords',
    registrations: 'accounts/registrations',
  }
  devise_scope :accounts do
    get 'signup', to: 'accounts/registrations#new'
    get 'signin', to: 'accounts/sessions#new'
    delete 'signout', to: 'accounts/sessions#destroy'
  end

  resources :health_units, path: 'unidades' do
    resources :comments, path: 'comentarios'
    collection do
      get :basic_search, path: 'resultados'
      get :advanced_search, path: 'pesquisar'
      get :list_by_specialties, path: 'especialidades', as: :specialty
      get :list_by_treatments, path: 'atendimentos', as: :treatments
      get :search_by_neighborhood, path: 'bairro', as: :neighborhood
    end
  end

  resources :professional_profiles, path: 'profissionais' do
    resources :comments, path: 'comentarios'
  end

  resources :service_providers, path: 'servicos' do
    resources :comments, path: 'comentarios'
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
