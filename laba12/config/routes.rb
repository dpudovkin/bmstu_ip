# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :sessions, only: %i[new create destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'number/input'
  get 'number/view'

  root 'sessions#new'

end
