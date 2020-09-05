Rails.application.routes.draw do
  root "posts#index"
  resources :posts do
  end
end
