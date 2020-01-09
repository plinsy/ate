Rails.application.routes.draw do
  scope :dashboard do
    get '/reports', to: 'dashboard#reports', as: 'dashboard_reports'
    get '/pricing', to: 'dashboard#pricing', as: 'dashboard_pricing'
    get '/settings', to: 'dashboard#settings', as: 'dashboard_settings'

    get '/', to: 'dashboard#index', as: "dashboard"
    get '/show', to: 'dashboard#show', as: "dashboard_show"
    get '/edit', to: 'dashboard#edit', as: "dashboard_edit"
    patch '/update', to: 'dashboard#update', as: "dashboard_update"
    delete '/destroy', to: 'dashboard#destroy', as: "dashboard_destroy"
    get '/search', to: 'dashboard#search', as: 'dashboard_search'
    post '/search', to: 'dashboard#search', as: 'dashboard_searches'
  end

  get '/search', to: 'searches#index', as: 'search'
  post '/search', to: 'searches#index', as: 'searches'

  resources :comments, only: [:index, :create, :update]

  post '/votes/:vote_type/:item_type/:item_id/:short', to: "votes#create", as: "votes"
  delete '/votes/:vote_type/:item_type/:item_id/:short', to: "votes#destroy", as: "vote"

  resources :places do
    resources :services
  end
  get '/go_to/:place_id', to: 'places#go_to', as: 'go_to'
  resources :accounts, only: %i[show edit update]
  resources :profiles, only: %i[show edit update]
	devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  scope :pages do
    get '/', to: 'pages#index', as: 'pages'
    get '/pricing', to: 'pages#pricing', as: 'pricing'
    get '/terms-conditions', to: 'pages#terms_conditions', as: 'terms_conditions'
    get '/contact', to: 'pages#contact', as: 'contact'
    get '/faq', to: 'pages#faq', as: 'faq'
  end

  scope :avatar do
    post '/new/:id', to: 'profiles#update', as: 'new_avatar'
  end

  get '/user/edit', to: 'users#edit', as: 'user_edit'

  root to: 'pages#index'
  
  # shared
  get '/tag_list/:item_type/:item_id/:category_id', to: 'shared#tag_list', as: 'tag_list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/super_admin', as: 'rails_admin'
end
