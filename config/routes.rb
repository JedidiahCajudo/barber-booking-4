Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  # Add these routes for dashboards
  get 'barbers/dashboard', to: 'barbers#dashboard', as: 'barbers_dashboard'
  get 'clients/dashboard', to: 'clients#dashboard', as: 'clients_dashboard'

  # Other routes...
  root to: 'home#index'  # or whatever you want as the root

end
