Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#index', as: "dashboard"
  get 'dashboard/show', as: "dashboard_show"
  get 'dashboard/edit', as: "dashboard_edit"
  patch 'dashboard/update', as: "dashboard_update"
  delete 'dashboard/destroy', as: "dashboard_destroy"

  get '/search', to: 'searches#index', as: 'search'
  get '/new/search', to: 'searches#new', as: 'new_search'
  post '/searches', to: 'searches#create', as: 'searches'

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

  get '/pages', to: 'pages#index'
  get 'pages/pricing'
  get 'pages/terms-conditions'
  get 'pages/contact'
  get 'pages/faq'

  get '/my-profile', to: 'users#profile', as: 'my_profile'
  get '/user/edit', to: 'users#edit', as: 'user_edit'

  root to: 'pages#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/super_admin', as: 'rails_admin'
end
