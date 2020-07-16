Rails.application.routes.draw do
  # get 'users/profile' , as: :profile
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users do
    member do
      get :confirm_email
    end
  end
  get "pages/schedule"
  get "pages/invitation"
  get "pages/loading"
  get "no_film", to: "pages#no_film", as: "no_film"
  get "friends", to: "pages#friends", as: "friends"
  get "my_events", to: "pages#my_events", as: "my_events"
  post "friends/request", to: "users#request_friend", as: "request_friend"
  get "friends/delete/:id", to: "users#delete_friend", as: "delete_friend"
  get "friends/accept/:id", to: "users#accept_friend", as: "accept_friend"
  get "friends/decline/:id", to: "users#decline_friend", as: "decline_friend"
  get "events/:id/answer", to: "events#answer", as: "answer"
  get "events/:id/final", to: "events#final", as: "final"
  get "guests/:id/confirm", to: "guests#confirm", as: "confirm"
  get "guests/:id/decline", to: "guests#decline", as: "decline"
  get "events/:id/result", to: "events#result", as: "result"

  resources :events, only: [:show, :new, :create, :destroy]
  resources :films, only: [:show, :new, :create, :index]
  resources :films do
    resources :favorites, only: [:new, :create, :destroy]
  end
  resources :favorites, only: [:index, :destroy]

  resources :reviews, only: [:show, :edit, :update, :destroy]
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    patch "draganddrop", to: "favorites#sort"
  end
end
