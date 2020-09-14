Rails.application.routes.draw do
  root "users#new"
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :posts do
    collection do
      post :confirm
      patch :confirm
    end
  end
end
