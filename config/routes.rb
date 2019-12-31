Rails.application.routes.draw do
  post '/votes/:vote_type/:item_type/:item_id/:short', to: "votes#create", as: "votes"
  delete '/votes/:vote_type/:item_type/:item_id/:short', to: "votes#destroy", as: "vote"

  resources :places do
    resources :services
  end
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

  get '/my-profile', to: 'users#profile', as: 'my_profile'
  get '/user/edit', to: 'users#edit', as: 'user_edit'

  root to: 'pages#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/super_admin', as: 'rails_admin'
end
