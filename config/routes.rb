Rails.application.routes.draw do
  resources :articles
  resources :users
  resources :favorites
  resource :auth, controller: :auth
  resource :profile, controller: :profile

  resources :articles do
    resources :comments
  end

  resources :articles do
    resources :favorites
  end

  namespace :api do
    resources :favorites
    resources :articles
    resources :search, only: [:show]
  end

  root to:'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
