Rails.application.routes.draw do
  # get 'users/profile' , as: :profile
  devise_for :users
  get 'pages/schedule'
  get 'pages/invitation'
  resources :events, only: [:show, :new, :create, :destroy]
  resources :films, only: [:show, :new, :create, :index]
  resources :films do
    resources :favorites, only: [:new, :create]
  end
  resources :favorites, only: [:index, :destroy]

  resources :reviews, only: [ :show, :edit, :update, :destroy ]
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    patch 'draganddrop', to: 'favorites#sort'
  end
end

