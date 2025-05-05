Rails.application.routes.draw do
  # Devise routes for Barbers and Users (clients)
  devise_for :barbers
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

  # Dashboard routes for both barbers and clients
  get 'barbers/dashboard', to: 'barbers#dashboard', as: 'barbers_dashboard'
  get 'clients/dashboard', to: 'clients#dashboard', as: 'clients_dashboard'

  # Barbershop routes for clients to view and browse barbershops
  resources :barbershops, only: [:index, :show]

  # Home route
  root to: 'home#index'
end
