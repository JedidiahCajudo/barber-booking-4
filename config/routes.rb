Rails.application.routes.draw do
  get 'barbershops/index'
  get 'barbershops/show'
  # Devise routes for Barbers
  devise_for :barbers, controllers: {
    sessions: 'barbers/sessions', # Custom controller for barber login
    registrations: 'barbers/registrations',
    passwords: 'barbers/passwords',
    confirmations: 'barbers/confirmations',
    unlocks: 'barbers/unlocks'
  }

  # Devise routes for Users (clients)
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
  get 'home/index'
  root to: 'home#index'
end
