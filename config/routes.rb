Rails.application.routes.draw do
  resources :user_jwts, only: [:create]
  resources :stores, only: [:create, :destroy, :show, :index]
  resources :users
  resources :items 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
