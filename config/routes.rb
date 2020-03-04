Rails.application.routes.draw do
  get 'users/profile' , as: :profile
  devise_for :users
  get 'pages/schedule'
  resources :favorites, only: [:create, :destroy]
  # get 'favorites/create'
  # get 'favorites/destroy'

  resources :events, only: [:show, :new, :create, :destroy]
  # get 'events/show'
  # get 'events/new'
  # get 'events/create'
  # get 'events/destroy'

  resources :films, only: [:show, :new, :create, :index]
  # get 'films/new'
  # get 'films/create'
  # get 'films/show'
  # get 'films/index'



  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

