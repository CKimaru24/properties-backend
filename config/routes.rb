Rails.application.routes.draw do
  resources :agents, only: [:index, :create, :destroy, :show, :update]
  resources :managers, only: [:index, :create, :destroy, :show, :update]
  resources :maintenances, only: [:index, :create, :destroy, :show]
  resources :tenants, only: [:index, :create, :destroy, :show, :update]
  resources :bookings, only: [:index, :create, :destroy, :show]
  resources :listings, only: [:index, :create, :destroy, :show, :update]
  resources :inboxs, only: [:index, :create, :destroy, :show]
  resources :drafts, only: [:index, :create, :destroy, :show]
  resources :composes, only: [:index, :create, :destroy, :show]
  resources :landlords, only: [:index, :create, :show]
  resources :contacts, only: [:index, :create]
  post '/login', to: 'landlords#login'
end

