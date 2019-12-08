Rails.application.routes.draw do
  resources :accounts
  resources :profiles
	devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  get '/pages', to: 'pages#index'
  get 'pages/pricing'
  get 'pages/terms-conditions'
  get 'pages/contact'

  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
