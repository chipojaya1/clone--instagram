Rails.application.routes.draw do
  root "users#new"
  resources :users, only: [:new, :create, :show] do
    collection do
      get :icon
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :posts do
    collection do
      post :confirm
      patch :confirm
    end
  end
end
