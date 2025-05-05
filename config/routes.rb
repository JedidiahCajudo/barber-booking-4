Rails.application.routes.draw do
  devise_for :barbers
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

  # Dashboard routes for barbers and clients
  get 'barbers/dashboard', to: 'barbers#dashboard', as: 'barbers_dashboard'
  get 'clients/dashboard', to: 'clients#dashboard', as: 'clients_dashboard'

  # Barbershop routes (make sure these are correct)
  resources :barbershops, only: [:index, :show]

  root to: 'home#index'
end
