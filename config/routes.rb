Rails.application.routes.draw do

  root to: 'users#new'

  resources :users, only: [:new, :create, :edit, :update]
  resources :messages, only: [:index, :create]
  resources :sessions, only: [:new, :create, :destroy]

  mount ActionCable.server => '/cable'
end
