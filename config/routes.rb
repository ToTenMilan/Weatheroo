Rails.application.routes.draw do
  get 'user_cities/new'
  get 'user_cities/create'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'forecast#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :user_cities, only: [:show, :new, :create]
end
