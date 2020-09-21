Rails.application.routes.draw do
  resources :contacts
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  get 'users/:id/favorites', to: 'users#favorites'
  resources :favorites
  resources :posts do
    collection do
      post :confirm
      patch :confirm
    end
  end
  root "users#new"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
