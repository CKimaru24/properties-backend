Rails.application.routes.draw do
  resources :composes, only: [:index, :create, :destroy, :show]
  resources :landlords, only: [:index, :create]
  resources :contacts, only: [:index, :create]
end

