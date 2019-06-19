# frozen_string_literal: true

Rails.application.routes.draw do
  resources :family_health_support_centers, path: 'centros-de-apoio'
  root to: 'pages#home'

  get '/about', to: 'pages#about'
  get '/collaborators', to: 'pages#collaborators'
  get '/developers', to: 'pages#developers'
  get '/pesquisa', to: 'pages#search'
  get '/suporte', to: 'pages#support'

  get '/403', to: 'errors#forbidden'
  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unprocessable_entity'
  get '/500', to: 'errors#internal_error'

  resources :user_profiles, path: 'usuarios'

  devise_for :accounts, controllers: {
    sessions: 'accounts/sessions',
    confirmations: 'accounts/confirmations',
    passwords: 'accounts/passwords',
    registrations: 'accounts/registrations'
  }

  devise_scope :accounts do
    get 'signup', to: 'accounts/registrations#new'
    get 'signin', to: 'accounts/sessions#new'
    delete 'signout', to: 'accounts/sessions#destroy'
  end

  resource_names = %w[basic_health_unit diagnosis_unit emergency_unit
                      family_health_unit hospital maternity_clinic mental_health_unit
                      odontology_unit pharmacy polyclinic specialized_unit health_unit]

  path_names = %w[unidades-basicas apoio-diagnostico emergencias
                  saude-da-familia hospitais maternidades saude-mental odontologia
                  farmacias policlinicas unidades-especializadas unidades]

  resource_names.zip(path_names).map do |resource_name, path_name|
    resources resource_name.pluralize.to_sym, path: path_name,
    controller: 'health_units', type: resource_name.camelize do
      resources :comments, path: 'comentarios'
      collection do
        get :basic_search, path: 'resultados'
        get :advanced_search, path: 'pesquisar'
        get :list_by_specialties, path: 'especialidades', as: :specialty
        get :list_by_treatments, path: 'atendimentos', as: :treatments
        get :search_by_neighborhood, path: 'bairro', as: :neighborhood
      end
    end
  end

  resources :family_health_support_centers, path: 'nasf' do
    resources :comments, path: 'comentarios'
    collection do
      get :support_unit, path: 'unidade-de-apoio', as: :support
      get :by_district, path: 'distrito', as: :district
    end
  end

  resources :professional_profiles, path: 'profissionais' do
    resources :comments, path: 'comentarios'
    collection do
      get :search_by_ocupation, path: 'profissao', as: :ocupation
      get :search_services, path: 'servicos', as: :services
      get :search_by_places, path: 'locais-de-atendimento', as: :places
      get :basic_search, path: 'resultados', as: :search
    end
  end

  resources :service_providers, path: 'servicos' do
    resources :comments, path: 'comentarios'
    collection do
      get :by_services, path: 'servicos', as: :services
      get :by_neighborhood, path: 'bairro', as: :neighborhood
      get :keyword_search, path: 'resultado', as: :results
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
